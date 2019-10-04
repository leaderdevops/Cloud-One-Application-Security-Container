# app-protect-djangonv-mac

Sample Django application for App Protect demos

## Detailed Description

This is a sample, vulnerable-on-purpose, Django application that can be used to demo Deep Security App Protect.

django-nV was created by the fine folks over at nVisium.

See:  http://github.com/nVisium/django.nV

NOTE: We're missing the smtp functionality for the 'forgot password' feature. To enable that we'd need to add:

```
python -m smtpd -n -c DebuggingServer localhost:1025
```

## Pre-Requisites for Usage

* Docker
* A Deep Security App Protect account

### Usage Instructions

1. Download & run the container:

    ```
    docker run --rm -d -p 8000:8000 --name djangonv-app-protect -e IMMUNIO_KEY=<KEY> -e IMMUNIO_SECRET=<SECRET> oznetnerd/djangonv-app-protect
    ```
Note: To obtain your Key and Secret, you'll need to:
* Log into your App Protect account
* Add a new group
* Copy your Key and Secret

The App Protect (immunio) library (which is ADDed via the Dockerfile) uses the Key and Secret to identify the App Protect group to which the application belongs.

2. Follow the instructions in [exploits.md](exploits.md) to exploit the application.  Demonstrate that the exploits work against the vulnerable app.

3. Switch App Protect rules from "Report" to "Mitigate".

4. Follow the instructions in [exploits.md](exploits.md) again. Demonstrate that the exploits **no longer** work.