# DO 418 entity too large error replication

## To replicate

## Prerequisites

1. DO Kubernetes cluster
1. Kubectl
1. Docker

## Steps

1. Clone this repo
1. Run `docker build -t yourdomainname:5000/test .`
1. Edit `deployment.yaml` and change the domain name to your domain name
1. Run `kubectl apply -f deployment.yaml`
1. Wait for the load balancer to be created
1. Update your DNS A record of your domain name to point to the load balancer IP
1. Wait for the DNS to propagate
1. Add your domain (e.g. `yourdomainname:5000`) to the list of `insecure-registries` in [Docker Engine's settings or in the config file](https://stackoverflow.com/a/43482179).
1. `docker login yourdomainname:5000 -u testuser -p digitaloceanloadbalancerissue` <!-- FIXME or do we need to use crane? -->
1. `docker push yourdomainname:5000/test` <!-- FIXME or do we need to use crane? -->

A 413 Entity too large, with the message `cloudflare` will be returned.
