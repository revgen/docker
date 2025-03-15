# SMTP Relay Server

This is a simple SMTP Relay server based on postfix.

You can run a local smtp server which are pointed to the real private email provider.

Tested on GMail and Yahoo.

**INPORTANT**: Smtp server doesn't have any authentocatio layer. Do not put it into the public network.

## Usage

```bash
docker run -it --rm -p 25:25 --env-file .env \
    --name smtprelayserver smtprelayserver
```

## Test local run

* Create a configuration file: ```cp env.example .env```
* Update .env file with your values: ```vim .env```
* Run test script: ```send-test-email.py```
