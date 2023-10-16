K8SMASTER=192.168.124.101

# reset
sudo kubeadm reset
sudo rm -r ~/.kube

# swapoff
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# init; https://stackoverflow.com/questions/52098214/kube-flannel-in-crashloopbackoff-status
sudo kubeadm init --control-plane-endpoint=$K8SMASTER --pod-network-cidr=10.244.0.0/16

# add config to kube
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# add flannel; https://github.com/flannel-io/flannel#deploying-flannel-manually
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

# check master status
kubectl cluster-info
kubectl get nodes

# enable kubelet; to auto start k8s master on startup
sudo systemctl enable kubelet
sudo systemctl status kubelet

# check journalctl -u kubelet.service -n 100 to find out if kubelet does not auto start.
# comment off /etc/fstab's swap line.
