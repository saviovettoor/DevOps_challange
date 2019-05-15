# ZeroDowntimeDeployment

```
I have created two images for this deployment myapp:v1 and myapp:v2

myapp:v1 will show "Version 1 of my awesome app!"

myapp:v2 will show "Version 2 of my awesome app!"
```

```
First lets deploy our sample app
]$kubectl create -f myapp.yaml

This will deploy our app (with 4 replicas) 

you can check the pods using
]$kubectl get pods
you will be able to see 4 myapp-deployment pods running.

Get the NodePort service detail
]$kubectl get service

NOTE: with clusterIP you can access the app inside the VM
```

```
Before roleing out update just login to another terminal of our cluster and run the below command
]$while true; do  curl 10.97.112.73; sleep 1s; done
NOTE: 10.97.112.73 My CLUSTER-IP

using this we can make sure that there is no outage while rollingout.

Now lets deploy our new version of app V2.

]$kubectl set image deployment/myapp-deployment myapp-container-v1=saviovettoor/myapp:v2

We can check the rollout status:
]$kubectl rollout status deployment/myapp-deployment

To view rollout history:
]$kubectl rollout history deployment/myapp-deployment

To rollback
]#kubectl rollout undo deployment myapp-deployment --to-revision=1
```

