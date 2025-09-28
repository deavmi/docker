personal
========


## Additional configuration

### Builder

Ensure you place a file named `.builder`
and set in it `BUILDER_GITEA_WEBHOOK_AUTH`.

### Quassel configuration

This helps you:

1. Create the certificates so that TLS can be used
to secure your connection with your Quassel core
2. Exec into the container, run a shell and then
connect to the core in order to create your user

#### Certificate generation

The original instructions are from [Baeldung's post](https://www.baeldung.com/openssl-self-signed-cert)
which I modified to not encrypt the `key` file as I don't know if (or how) Quassel
would be able to de-encrypt the key via a password.

```bash
#!/bin/sh
# Original instructions are
# from https://www.baeldung.com/openssl-self-signed-cert

if [ -e $KEY_FILE ]
then
        KEY_FILE=key.key
fi

if [ -e $SIGN_REQ_FILE ]
then
        SIGN_REQ_FILE=csr.csr
fi

if [ -e $CERT_FILE ]
then
        CERT_FILE=cert.crt
fi

echo "Generating key file '$KEY_FILE'..."
openssl genrsa -out "$KEY_FILE" 2048

echo "Generating signing request and saving to '$SIGN_REQ_FILE'..."
openssl req -key "$KEY_FILE" -new -out "$SIGN_REQ_FILE"

echo "Generating certificate and saving to '$CERT_FILE'..."
openssl x509 -signkey "$KEY_FILE" -in "$SIGN_REQ_FILE" -req -out "$CERT_FILE"
```

My version let's you specify the names of all the files.
I have left them as the above as the file names chosen
above are those that the Quassel container will search
for as defined in the Quassel-section in the `.env`
file. If you want to change them then do:

```bash
export KEY_FILE=...
export SIGN_REQ_FILE=...
export CERT_FILE=...
```

... before you run the script.


If you change them in `.env` then ensure you change
them here so that they can be found.

Also only the `.key` and `.cert` files are needed.
The `.key` for decryption of course (its the private
part) and the `.cert` is the public part _with
certifying info_.

#### User configuration

Run it, then exec-into the container with:

```bash
docker exec -ti quassel /bin/sh
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

## Credits

Thanks a lot [kalaksi](https://github.com/kalaksi/) for all his
help aiding with the Docker setup for Quassel. Check out his
[setup](https://github.com/kalaksi/docker-quassel).
