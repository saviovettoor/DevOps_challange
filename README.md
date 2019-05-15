## We are going to approach the assignment in the following steps:

1. Docker image creation
    - First we are going to create an image of our application.
    - Once the image is created we are uploading the image to the public docker hub: [Link](https://cloud.docker.com/repository/registry-1.docker.io/saviovettoor/myapp)

2. Setting up a 3 node kubernetes cluster.
    - I used Centos(CentOS Linux release 7.6.1810 (Core)) VMs to setup the cluster
    - Kubernetes Version: v1.14.1
    - Docker Server version: 1.13.1
    - Once the cluster setuped [Link](https://github.com/saviovettoor/risk.ident_challange/tree/master/cluster_setup)
    - we will be deploying our app.
3. Basic role out without down time.
    - In the first section we are going to deploy our app [link](https://github.com/saviovettoor/risk.ident_challange/blob/master/ZeroDowntimeDeployment/README.md#zerodowntimedeployment)
    - And the second section we will be rollingout update [link](https://github.com/saviovettoor/risk.ident_challange/blob/master/ZeroDowntimeDeployment/README.md#rolling-out-update)    
4. Production grade setup.
    Following are the action to be taken for make app production ready.
    - Setting up the cluster in cloud(aws/gcp/azure) with HA.
    - Enableing both Horizontal and vertical scale of app (Based on traffic/CPU/Memory).
    - In one click provisioning entire cluster setup (using terraform or ansible).
    - Monitoing tha application and cluster (prometheus/nagios )
    - Enhaceing the deployment using Istio by canary deployment or using Blue/Green Deployment[link](https://github.com/saviovettoor/risk.ident_challange/blob/master/BlueGreenDeploymentUsingIstio/README.md#bluegreen-deployment-using-istio) 
