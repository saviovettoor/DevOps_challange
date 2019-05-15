# Kubernetes Cluster setup on Centos
```
Master Node
############

]$sudo su
]#swapoff -a
]#vi /etc/fstab --> comment out /root/swap swap swap sw 0 0
]#yum update -y
]#setenforce 0
]# vi /etc/selinux/config ->  change in the file SELINUX=disabled, otherwise on next reboot Selinux will get enable.
]#yum -y install docker
]#systemctl enable docker; systemctl start docker

#]cat <<EOF > /etc/yum.repos.d/kubernetes.repo
	[kubernetes]
	name=Kubernetes
	baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
	enabled=1
	gpgcheck=1
	repo_gpgcheck=1
	gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
   EOF
]#yum install -y kubelet kubeadm kubectl
]#systemctl start kubelet; systemctl enable kubelet
]#cat <<EOF >  /etc/sysctl.d/k8s.conf
	net.bridge.bridge-nf-call-ip6tables = 1
	net.bridge.bridge-nf-call-iptables = 1
	EOF
]#sysctl --system -> check
]#kubeadm init --pod-network-cidr=10.244.0.0/16

]#exit
]$mkdir -p $HOME/.kube
]$sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 	
]$sudo chown $(id -u):$(id -g) $HOME/.kube/config
]$export kubever=$(kubectl version | base64 | tr -d '\n')
]$kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"	  
```


```
Worker Node
############
]$sudo su
]#swapoff -a
]#vi /etc/fstab --> comment out /root/swap swap swap sw 0 0
]#yum update -y
]#setenforce 0
]# vi /etc/selinux/config -> change in the file SELINUX=disabled, otherwise on next reboot Selinux will get enable.
]#yum -y install docker
]#systemctl enable docker; systemctl start docker
#]cat <<EOF > /etc/yum.repos.d/kubernetes.repo
	[kubernetes]
	name=Kubernetes
	baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
	enabled=1
	gpgcheck=1
	repo_gpgcheck=1
	gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
   EOF
]#yum install -y kubelet kubeadm kubectl
]#systemctl start kubelet
]#systemctl enable kubelet
]#cat <<EOF >  /etc/sysctl.d/k8s.conf
	net.bridge.bridge-nf-call-ip6tables = 1
	net.bridge.bridge-nf-call-iptables = 1
	EOF
]#sysctl --system -> check
]# kubeadm join --token ----> what copied from master
```

Once the Worker nodes are added, to check the cluster node list run below command on master
]#kubectl get nodes
