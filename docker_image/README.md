# Image Creation

```
Dockerfile Instructions
------------------------
FROM nginx:latest 						- Setting Base image  as nginx:latest
LABEL <maintainer>=SavioMathew 		- Adds metadata to an image
EXPOSE 80 433 							- Informs Docker that the container listens on the network ports 80 and 443 at runtime.
COPY index.html /usr/share/nginx/html 	- Copy index.html to /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"] 		-  Provides a default for an executing container.
```

```
Build docker image 
------------------
]#docker build -t saviovettoor/myapp:v1 .

NOTE: Dockerfile should be in current directory or we can use -f flag with specific path/filename. 
```

```
Push image to repo (https://hub.docker.com)
-------------------------------------------
docker login -u saviovettoor
docker image push saviovettoor/myapp:v1
```

```
Some docker commands
---------------------
]#docker image ls # to view all images
]#docker image pull saviovettoor/myapp:v1 # to pulldown image saviovettoor/myserver:v1
]#docker container ls #to listout running container
]#docker run -p 8080:80 saviovettoor/myapp:v1 #to test the image
```
