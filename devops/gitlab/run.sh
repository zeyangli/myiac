## NFS
mkdir -p /data/storage/kubernetes/gitlab/{config,logs,data}
chmod 777 -R /data/storage/kubernetes/gitlab/

## Docker images
docker pull gitlab/gitlab-ce:16.2.2-ce.0