##https://docs.datadoghq.com/agent/kubernetes/daemonset_setup/
kubectl apply -f https://raw.githubusercontent.com/DataDog/datadog-agent/master/Dockerfiles/manifests/rbac/clusterrole.yaml
kubectl apply -f https://raw.githubusercontent.com/DataDog/datadog-agent/master/Dockerfiles/manifests/rbac/serviceaccount.yaml
kubectl apply -f https://raw.githubusercontent.com/DataDog/datadog-agent/master/Dockerfiles/manifests/rbac/clusterrolebinding.yaml

kubectl apply -f https://github.com/DataDog/datadog-agent/raw/master/Dockerfiles/manifests/cluster-agent/rbac/rbac-cluster-agent.yaml

# Kubernetes Event Collection
# https://docs.datadoghq.com/agent/kubernetes/event_collection/
kubectl create configmap datadogtoken --from-literal="event.tokenKey"="0"

kubectl create configmap dd-confd  --from-file dd-confd

kubectl create secret generic dd --from-env-file=secrets.txt

##https://docs.datadoghq.com/integrations/kubernetes/#kubernetes-state-metrics
##https://docs.datadoghq.com/agent/kubernetes/host_setup/
kubectl apply -f kube-state-metrics/examples/standard
# kubectl apply -f metrics-server/deploy/1.8+

kubectl apply -f datadog-config.yaml
kubectl apply -f datadog-agent.yaml

kubectl apply -f stresser.yaml

##OpenShift
# kubectl apply -f https://raw.githubusercontent.com/DataDog/datadog-agent/master/Dockerfiles/manifests/openshift/scc.yaml
# git clone https://github.com/kubernetes/kube-state-metrics.git
