Docker Debugging Container
========================
This is a super simple container that can be used for debugging directly inside Kubernetes.

Container Tools
---------------
This container is running Ubuntu 16.04 with the following tools installed for use in an interactive shell:

1. Packages
    1. `vim` - For editing files in the container to adjust tests
    2. `curl` - For testing APIs
    3. `wget` - For downloading files
    4. `dnsutils` - For testing DNS
    5. `apache2` - Webserver that the container runs via CMD
    6. `libapache2-mod-php` - PHP for Apache2
2. Services
    1. A simple PHP page on port 80 that will show the headers sent to the webserver
3. Other Stuff
    1. A stripped down version of my usual bash profile

Deployment Examples
-------------------
There are two deployment examples included with this repo:

1. [docker-compose](deployments/docker-compose.yml) - Deploy locally and listen on port 2000
2. [Kubernetes](deployments/kubernetes.yml) - Deploy to Kubernetes in the `kube-public` namespaces listening on port 80 with no ingress or service

You can also run `docker run -d --name debugging -p2000:80 ahrenstein/debugging:latest` to deploy locally as well.

Why?
----
Busybox was too simple for some of the debugging I needed to do. I wanted a container that I can test host headers with, but also have an interactive shell with some common packages and the ability to install more via apt-get should I need them.

Maintainers
----------
1. [Matthew Ahrenstein](https://www.ahrenstein.com)
