K8SMASTER=192.168.124.101

scp dh@$K8SMASTER:~/.kube/config ~/.kube/config
kubectl get pods -A
