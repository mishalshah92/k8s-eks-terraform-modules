# k8s-eks-terraform-modules

## Introduction

Terraform modules for creating kubernetes master and worker cluster on AWS [EKS](https://aws.amazon.com/eks/).

## Examples
- EKS Master: See [example](test/eks_master/main.tf)
- EKS Node Group: See [example](test/eks_node-group/main.tf)
- EC2 Node Group: See [example](test/ec2_node_groups/main.tf)

## Test

**Terraform version**: 0.12.23

### **Param files**

Configurations are set into the [param files](test). Please update if require.

- **Common Params**: [commons.tfvars](test/commons.tfvars)
- **EKS Master Params**: [eks_master.tfvars](test/eks_master.tfvars)
- **EC2 Node Group Params**: [ec2_node_group.tfvars](test/ec2_node_group.tfvars)
- **EKS Node Group Params**: [eks_node_group.tfvars](test/eks_node_group.tfvars)

### **How to execute?**

```shell script
$ make [Target]
```

#### **Targets**

- `$ make deploy-eks-master`

    It will create the EKS cluster. This will generate the kubeconfig file with name `kubeconfig.yaml`.
 
- `$ make destroy-eks-master`

    It will destroy the EKS cluster.x    

- `$ make deploy-ec2-nodes`

    It will create the EC2 node group for EKS cluster. This will generate the Kubernetes config map file with
    name `k8s_config_map_aws_auth.yaml`
 
- `$ make destroy-ec2-nodes`

    It will destroy EC2 node group for EKS cluster.

- `$ make deploy-eks-nodes`

    It will create the EKS node group for EKS cluster.
 
- `$ make destroy-eks-nodes`

    It will destroy EKS node group for EKS cluster.


#### Post operations

- After deploying EKS master, you have to update local kubernetes config. 

```shell script
$ aws eks --region {aws_region} update-kubeconfig --name {cluster_name}
```

-  Apply Kubernetes config

```shell script
$ kubectl apply -f k8s_config_map_aws_auth.yaml
```

-  To view nodes

```shell script
$ kubectl get nodes --watch
```
    
## Overview

- **Maintainer**: mishalshah92@gmail.com