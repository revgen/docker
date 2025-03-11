# Base docker image with XWindow setup and RDP access

## Launch

```bash
docker run -it --rm -e MAINUSER_PASSWORD=123456 -p 3389:3389 rev9en/xwindow
```
