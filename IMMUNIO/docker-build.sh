#!/bin/bash

set -e

# We need to override some files from the upstream directory to install IMMUNIO. Copy the
# files we need to change to `build/`. The Dockerfile COPYs them from there.
rm -fr ../build
mkdir -p ../build
cp ../upstream/taskManager/wsgi.py ../build/wsgi.py
cp ../upstream/runapp.sh ../build/runapp.sh

# `manage.py runserver` in python3 binds to all IPs, in python2 we need to
# explicitly request it. Add the bind IP:PORT to the command
sed -i '' '${s/$/ 0.0.0.0:8000/;}' ../build/runapp.sh

# Build one image without App Protect running
docker build -t djangonv  ../

# Build another image WITH App Protect running by adding `import immunio.start` to `wsgi.py`
sed -i.bak '1i\
import immunio.start
' ../build/wsgi.py

docker build -t djangonv-immunio ../
