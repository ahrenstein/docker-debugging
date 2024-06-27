Docker Debugging Container
========================
This is a super simple container that can be used for debugging directly inside Kubernetes.

Container Tools
---------------
This container is running Ubuntu 22.04 with the following tools installed for use in an interactive shell:

1. Packages
    1. `vim` - For editing files in the container to adjust tests
    2. `curl` - For testing APIs
    3. `wget` - For downloading files
    4. `dnsutils` - For testing DNS
    5. `telnet` - For testing network connections
    6. `apache2` - Webserver that the container runs via CMD
    7. `libapache2-mod-php` - PHP for Apache2
    8. `iputils-ping` - Adding the ping command for basic network tests
   9. `net-tools` - Various network tools
2. Services
    1. A simple PHP page on port 80 that will show the container IP and the headers sent to the web server.
3. Other Stuff
    1. A stripped down version of my usual bash profile.

Architectures
-------------
This container is available for `linux/amd64`, and `linux/arm64`

Deployment Examples
-------------------
There are two deployment examples included with this repo:

1. [docker-compose](deployments/docker-compose.yml) - Deploy locally and listen on port 2000
2. [Kubernetes](deployments/kubernetes.yml) - Deploy to Kubernetes in the `kube-public` namespace listening on port 80 with no ingress or service.
   1. Additionally, Route 1337 LLC has a [public helm chart](https://helm-charts.route1337.com/) using this container. 

You can also run `docker run -d --name debugging -p2000:80 ahrenstein/debugging:latest` to deploy locally as well.

Why?
----
Busybox was too simple for some of the debugging I needed to do. I wanted a container that I can test host headers with, but also have an interactive shell with some common packages and the ability to install more via apt-get should I need them.

Availability
------------
All `linux/amd64` versions up to 5.0.0 are publicly available on [Docker Hub](https://hub.docker.com/r/ahrenstein/debugging)  
All `linux/amd64` and `linux/arm64` versions from 5.0.1 onward are publicly available on [Docker Hub](https://hub.docker.com/r/ahrenstein/debugging) and [GitHub Container Registry](https://github.com/ahrenstein/docker-debugging/pkgs/container/docker-debugging)

Maintainers
----------
1. [Matthew Ahrenstein](https://www.ahrenstein.com)
