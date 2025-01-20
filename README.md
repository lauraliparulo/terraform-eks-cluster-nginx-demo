# Terraform - EKS Cluster provisioning and Service exposure example

This repo is based on the one provided by Terraform.

It includes a script called "run_all.sh", which allows you to set a full Nginx deployment and run the application hosted on the EKS Kubernetes Cluster right into the browser.

The Terraform apply command takes quite long to complete (At least 10 Minutes).


## Policies 

Make sure you attach the policy  AWSKeyManagementServicePowerUser and AmazonEKSClusterPolicy to the current IAM user!

## References

- [Provision an EKS Cluster tutorial](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks)

- [Deploying Nginx App on EKS](https://cloudzenia.com/blog/k8s-series-part-3-deploying-a-simple-nginx-app-on-aws-eks/)

