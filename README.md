Messagebird's test exercises

This repository contains solutions for test exercises provided by Messagebird as part of an interview process. The requirements for
exercises are covered in requirements.pdf

Solutions

Exercise 1

All of design considerations are taking in account time limit as a primary project constraint.
Web app is written in Flask, containerized and pushed to GCR.
App runs on GKE and is exposed to internet via external load balancer with static ip with port-forwarding on port 80.
Application provides metrics for prometheus via prometheus-client library.



Exercise 2

For the second assignment I've deployed a VM on GCE via terraform.

Prometheus server is deployed as a docker container on a VM https://hub.docker.com/r/prom/prometheus/

Prometheus metrics scraping was first tested locally, then prometheus configuration is passed as
prometheus.yml to prometheus container.

Google cloud json and ssh key used by terraform are scraped from the project.

Overall I've exceed 2 hours of allocated time.
