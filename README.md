# app-protect-djangonv-mac
Sample Django application for App Protect demos
## Detailed Description
This is a sample, vulnerable-on-purpose, Django application that can be used to demo Deep Security App Protect.

django-nV was created by the fine folks over at nVisium.

See:  http://github.com/nVisium/django.nV


 - note: missing the smtp functionality for the forgot password feature. to enable that we'd need to add:

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
2. Change into the app-protect-djangonv-mac/IMMUNIO/ directory
```
cd app-protect-djangonv-mac/IMMUNIO/
```
3. Run the docker-build.sh script to build the two images (djangonv and djangonv-immunio).
```
./docker-build.sh
```
4. Run the non-protected djangonv image
```
docker run -d -p 8000:8000 djangonv
```
5. Follow the instructions in exploits.md to exploit the application

6. Stop the djangonv container
```
docker stop <image_id>
```
7. Run the App Protect (django-immunio) image and pass in your App Protect Group's key/secret
```
docker run -d -p 8000:8000 -e IMMUNIO_KEY='your-key-goes-here' -e IMMUNIO_SECRET='your-secret-goes-here'  djangonv-immunio
```
Note: To obtain your Key and Secret, you'll need to:
* Log into your App Protect account
* Add a new group
* Copy your Key and Secret

The App Protect (immunio) library (which is ADDed via the Dockerfile) uses the Key and Secret to identify the App Protect group to which the application belongs.
8. Follow the instructions in exploits.md to exploit the application (and show that the exploits are blocked by App Protect).

