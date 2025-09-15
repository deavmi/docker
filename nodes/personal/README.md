personal
========

## Environment variables

### Quassel

For your **first run** ensure that within the `.quassel`
environment file (which you will have to create) you
do not have `QUASSEL_CFG_ENV` set.

Then connect to your Quassel core and go through the
setup wizard.

Once done, then go and set `QUASSEL_CFG_ENV` to anything
that you want and this will disable the setup wizard.

### Quassel configuration

Run it, then exec-into the container with:

```bash
docker exec -ti quassel /bin/bash
```

Then go into `bin/` and run:

```bash
DB_BACKEND=PostgreSQL DB_PGSQL_USERNAME=quassel_user DB_PGSQL_PASSWORD=quassel_pass DB_PGSQL_HOSTNAME=quassel-db DB_PGSQL_DATABASE=quassel DB_PGSQL_PORT=54
32 ./quasselcore  --config-from-environment  --add-user
```

This will start an interactive session where you can
perform the configuration. After this you will then
want to exit out and restart the container and it
should be good to go.
