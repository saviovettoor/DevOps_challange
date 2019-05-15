#ZeroDowntimeDeployment

```
I have created two images for this deployment myapp:v1 and myapp:v2

myapp:v1 will show "Version 1 of my awesome app!"

myapp:v2 will show "Version 2 of my awesome app!"
```

```
First lets deploy our sample app
]#kubectl create -f myapp.yml

This will deploy our app (with 4 replicas) 

you can check the pods using
]#kubectl get pods
```
