Services
========

This is for my services node.


## Secrets

Please ensure that the following secrets are configured. Also
note that these are all file-based secrets and must be located
within a directory accessible at `/mnt/datadisk/secrets`.

1. `minio_access_key.txt`
2. `minio_secret_access_key.txt`

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
