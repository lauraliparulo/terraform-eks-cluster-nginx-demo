terraform apply --auto-approve

CLUSTER_NAME=$(terraform output cluster_name)
CLUSTER_ID=$(echo "${CLUSTER_NAME}" | tr --delete \")

REGION_OUT=$(terraform output region)
REGION=$(echo "${REGION_OUT}" | tr --delete \")

#install eksctl
# curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
# sudo mv /tmp/eksctl /usr/local/bin
# eksctl version

aws eks --region $REGION update-kubeconfig --name $CLUSTER_ID
kubectl apply -f k8s/nginx_namespace.yaml -f k8s/nginx_deployment.yaml -f k8s/nginx_service.yaml
kubectl get service nginx-service --namespace nginx-ns --output='jsonpath={.status.loadBalancer.ingress[0].hostname}' && open http://$(kubectl get service nginx-service --namespace nginx-ns --output='jsonpath={.status.loadBalancer.ingress[0].hostname}')