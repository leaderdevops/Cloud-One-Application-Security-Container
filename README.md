# app-protect-djangonv-mac
Sample Django application for App Protect demos
## Detailed Description
This is a sample, vulnerable-on-purpose, Django application that can be used to demo Deep Security App Protect.

Using the instructions below will create 2 docker images (one without and one with App Protect installed).  Instructions for exploiting the vulernable app are located within the exploits.md file.

django-nV was created by the fine folks over at nVisium.

See:  http://github.com/nVisium/django.nV


 NOTE: We're missing the smtp functionality for the 'forgot password' feature. To enable that we'd need to add:

 python -m smtpd -n -c DebuggingServer localhost:1025

## Pre-Requisites for Usage
* Git
* Docker
* A Deep Security App Protect account

### Usage Instructions

1. Clone the repository
```
git clone https://gitlab.com/howiehowerton/app-protect-djangonv-mac.git
```
2. Change into the app-protect-djangonv-mac directory
```
cd app-protect-djangonv-mac
```
3. Build the Docker container:

```
docker build -t djangonv-immunio .
```

4. Run the App Protect (django-immunio) image WITHOUT keys:
```
docker run --rm -d -p 8000:8000 --name djangonv-immunio-unprotected djangonv-immunio
```

5. Follow the instructions in [exploits.md](exploits.md) to exploit the application.  Demonstrate that the exploits work against the vulnerable app.

6. Stop the unprotected container:

```
docker stop djangonv-immunio-unprotected
```

7. Run the App Protect (django-immunio) image WITH keys:

```
docker run --rm -d -p 8000:8000 --name djangonv-immunio -e IMMUNIO_KEY=<KEY> -e IMMUNIO_SECRET=<SECRET> djangonv-immunio
```

8. Follow the instructions in [exploits.md](exploits.md) again. Demonstrate that the exploits **no longer** work.