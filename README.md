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
3. Update the immunio.ini with your App Protect Group's Key and Secret values:

Note: To obtain your Key and Secret, you'll need to:
* Log into your App Protect account
* Add a new group
* Copy your Key and Secret

The App Protect (immunio) library (which is ADDed via the Dockerfile) uses the Key and Secret to identify the App Protect group to which the application belongs.  The App Protect group's policy will be applied to the application.  All policy configurations are made via the App Protect console.

4. Change into the IMMUNIO directory
```
cd IMMUNIO/
```
5. Run the docker-build.sh script to build the two Docker images (djangonv and djangonv-immunio).
```
./docker-build.sh
```
6. Run the non-protected djangonv image
```
docker run -d -p 8000:8000 djangonv
```
7. Follow the instructions in exploits.md to exploit the application

8. Stop the djangonv container
```
docker stop <image_id>
```
9. Run the App Protect (django-immunio) image
```
docker run -d -p 8000:8000 djangonv-immunio
```

