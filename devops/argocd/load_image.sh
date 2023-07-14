# GetDockerImage
docker pull ccr.ccs.tencentyun.com/argocds/dex:v2.35.3
docker pull ccr.ccs.tencentyun.com/argocds/redis:7.0.8-alpine
docker pull ccr.ccs.tencentyun.com/argocds/argocd:v2.6.7

# TagDockerImage
docker tag ccr.ccs.tencentyun.com/argocds/dex:v2.35.3 ghcr.io/dexidp/dex:v2.35.3 
docker tag ccr.ccs.tencentyun.com/argocds/argocd:v2.6.7 quay.io/argoproj/argocd:v2.6.7 
docker tag ccr.ccs.tencentyun.com/argocds/redis:7.0.8-alpine redis:7.0.8-alpine 

# From local to Kind K8s Cluster
images=`grep image: install.yaml | awk -F 'image: ' '{print $NF}' | sort -n | uniq`

for image in $images
do
  kind load  docker-image $image --name devopscluster
done


# Install argocd
kubectl create ns argocd
kubectl -n argocd apply -f install.yaml
kubectl -n argocd apply -f ingress.yaml
