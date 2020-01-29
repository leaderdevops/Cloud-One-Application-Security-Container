# app-protect-djangonv-mac

Sample Django application for Cloud One Application Security demos

## Detailed Description

This is a sample, vulnerable-on-purpose, Django application that can be used to demo Cloud One Application Security.

django-nV was created by the fine folks over at nVisium.

See:  http://github.com/nVisium/django.nV

## Pre-Requisites for Usage

* Docker
* A Cloud One Application Security account

### Usage Instructions

1. Download & run the container:

    ```
    docker run --rm -d -p 8000:8000 --name djangonv-app-protect -e TREND_AP_KEY=<KEY> -e TREND_AP_SECRET=<SECRET> howiehowerton/djangonv-app-protect
    ```
Note: To obtain your Key and Secret, you'll need to:
* Log into your App Protect account (https://dashboard.app-protect.trendmicro.com/)
* Add a new group
* Copy your Key and Secret

The Cloud One Application Security library (which is ADDed via the Dockerfile) uses the Key and Secret to identify the App Protect group to which the application belongs.

2. Follow the instructions in [exploits.md](exploits.md) to exploit the application.  Demonstrate that the exploits work against the vulnerable app.

3. Switch Cloud One Application Security rules from "Report" to "Mitigate".

4. Follow the instructions in [exploits.md](exploits.md) again. Demonstrate that the exploits **no longer** work.