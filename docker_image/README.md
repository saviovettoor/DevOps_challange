# Image Creation

```
Dockerfile Instructions

FROM nginx:latest 						- Setting Base image  as nginx:latest
LABEL <maintainer>=Savio Mathew 		- Adds metadata to an image
EXPOSE 80 433 							- Informs Docker that the container listens on the network ports 80 and 443 at runtime.
COPY index.html /usr/share/nginx/html 	- Copy index.html to /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"] 		-  Provides a default for an executing container.
```

```
Build docker image 

]#docker build -t saviovettoor/myserver:v1 .

NOTE: Dockerfile should be in current directory or we can use -f flag with specific path/filename. 
```

```
Push image to repo (https://hub.docker.com)

docker login -u saviovettoor
docker image push saviovettoor/myserver:v1
```

```
Basic docker commands

]#docker image ls # to view all images
]#docker image pull saviovettoor/myserver:v1 # to pulldown image saviovettoor/myserver:v1
]#docker container ls #to listout running container
```