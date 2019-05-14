#Blue/Green Deployment using Istio

```
Istio Installation
-------------------
curl -L https://git.io/getLatestIstio | sh -
```

```
Since we are running Istio with baremetal, we need to change Ingress Gateway service from type LoadBalancer to NodePort.
Open the file install/kubernetes/istio-demo.yaml, search for LoadBalancer and replace it with NodePort.
```

```
Apply custome resource defenitions

]#for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done
```

```
Install Istio within Kubernetes:

]#kubectl apply -f install/kubernetes/istio-demo.yaml

To view list of namespaces:
]#kubectl get namespace

This will create a new namespace called istio-system under this many objects also will get create.

Create namespace demo to deploy our app
]#kubectl create ns demo

There will multiple pods deployed by Istio 
]#kubectl get pods -n=istio-system.
```

```
Now let add a label to demo namespace
]#kubectl label namespace demo istio-injection=enabled

what does basically the command will do is instruct istio to automatically attach a sidecar to each service in the namespace demo where our app is running.
```

```
Now lets deploy our app at demo namespace
]#kubectl -n=demo create -f app.yml

lets check the pods deployed by our app
]#kubectl -n=demo get pod

lets check the deployed service
]#kubectl -n=demo get svc 
```

```
Now lets start Configure Blue/Green Deployment

First we will deploy gateway, gateway is responsible for routing the traffic from k8s ingress into service-mesh
]#kubectl -n=demo create -f gateway.yml


VirtualService is the link between the application and gateway we created gateway basically dont know to which version of app the traffic should be routed even virtual service can route traffic based on header like android app or ios/ subdomain base. 
]#kubectl -n=demo create -f virtualservice.yml

For selectively route traffic from one version to other we use destination rule.
]#kubectl -n=demo create -f destinationrule.yml
```

```
We can test the app routeing is working as exected by accesssing the app via browser
```