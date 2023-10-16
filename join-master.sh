K8SMASTER=192.168.124.101

# reset
sudo kubeadm reset
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# get this from master. todo: make it a script
# sudo kubeadm join $K8SMASTER:6443 --token vt4ua6.wcma2y8pl4menxh2 \
#    --discovery-token-ca-cert-hash sha256:0494aa7fc6ced8f8e7b20137ec0c5d2699dc5f8e616656932ff9173c94962a36

# enable kubelet; to auto start k8s master on startup
sudo systemctl enable kubelet
sudo systemctl status kubelet