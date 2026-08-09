Preparation
===========

Please follow these steps before beginning.

### For YggMail

Please set the following in a file called `.env.yggmail.secrets`
in the **root** of the repository.

1. `YGGMAIL_UI_DB_USERNAME`
	* For the Postgres <-> RoundCube Mail
2. `YGGMAIL_UI_DB_PASSWORD`
	* For the Postgres <-> RoundCube Mail
3. `YGGMAIL_TLS_PASSWORD`
	* Set this to _something_

Then also create, in the `.. volumes/yggmail/pwhash.secret`
a brypt-hashed password for your mail password.

### For Paperless

Please set the following in a file called `.env.paperless.secrets`
in the **root** of the repository.

1. `PAPERLESS_DB_USERNAME`
	* For the Postgres <-> Paperless
2. `PAPERLESS_DB_PASSWORD`
	* For the Postgres <-> Paperless
3. `PAPERLESS_SECRET_KEY`
	* Some random string used for token generation