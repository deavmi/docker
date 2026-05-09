ATHENS_STORAGE=/tmp/athens
docker run -v $ATHENS_STORAGE:/var/lib/athens:z \
   -e ATHENS_DISK_STORAGE_ROOT=/var/lib/athens \
   -e ATHENS_STORAGE_TYPE=disk \
   --name athens-proxy \
   --restart always \
   -p 3000:3000 \
   gomods/athens:latest
