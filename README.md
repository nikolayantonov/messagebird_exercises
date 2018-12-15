Messagebird's test exercises

This repository contains solutions for test exercises provided by Messagebird as part of an interview process. The requirements for
exercises are covered in requirements.pdf

Solutions

Exercise 1

All of design considerations are taking in account time limit as a primary project constraint.
Web app is written in Flask, containerized and pushed to GCR.
App runs on GKE and is exposed to internet via external load balancer with static ip on port 80.
Application provides metrics for prometheus via prometheus-client library.



Exercise 2

For the second assignment I've deployed a VM on GCE via terraform,
but had not time left to automate prometheus deployment.

I've removed Google Cloud json key which was used by terraform to
establish identity via Google Cloud.

Overall, I've exceeded allocated 2 hours.
