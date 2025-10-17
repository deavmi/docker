Services
========

This is for my services node.

## Secrets

Create the following files in this directory.

**Warning:** Ensure to change the default values!

### `.minio`

Must contain:

```
MINIO_ROOT_USER=minio_secret1
MINIO_ROOT_PASSWORD=minio_secret2
```

### `.gitea`

Must contain:

```
GITEA__storage__MINIO_ACCESS_KEY_ID=minio_secret1
GITEA__storage__MINIO_SECRET_ACCESS_KEY=minio_secret2
```

### `.xmpp`

Must containg:

```
REGISTER_ADMIN_PASSWORD=lll
```

Set this to the password that should be used for
the admin XMPP account.

## IM

### ejabberd

Ensure that the directories configured as:

1. `XMPP_DATA_PATH`
	* Path for data
2. `XMPP_UPLOADS_PATH`
	* Path for uploads

Have the uid/gid of `9000` as that is what
the user in the ejabberd container runs as
and needs the files to be accessible to it.
