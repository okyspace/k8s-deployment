# k8s-deployment

# check ports in use
https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/
```
sudo lsof -i -P -n | grep LISTEN
sudo netstat -tulpn | grep LISTEN
sudo ss -tulpn | grep LISTEN
sudo lsof -i:22 ## see a specific port such as 22 ##
sudo nmap -sTU -O IP-address-Here
```

# check kubelet service
journalctl --unit=kubelet.service -n 100

# enable k8s to auto start
1. ensure swap is off in /etc/fstab
2. enable kubelet
sudo systemctl enable kubelet

# firewalld to enable port to go through
sudo apt install firewalld
sudo firewall-cmd --add-port=443/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all


# Useful links
Ensure CNU network is installed. Can use flannel. https://stackoverflow.com/questions/49112336/container-runtime-network-not-ready-cni-config-uninitialized
