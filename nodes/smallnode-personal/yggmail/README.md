Preparation
===========

Ensure that you pass in the interpolation variable
named `YGGMAIL_TLS_PASSWORD` when you start up the
service.

Also set the following:

1. `YGGMAIL_UI_DB_USERNAME`
2. `YGGMAIL_UI_DB_PASSWORD`

When running use:

```bash
YGGMAIL_TLS_PASSWORD=<your password> docker compose up yggmail yggmail_tls
```

