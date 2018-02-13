### 1. Introduction
This repository contains tooling for deploying efs in Amazon AWS using terraform and ansible.

### 2. Context
This repo is part of a parent project to achieve the ability of possibility of controlled deployments in different environments so, that we can rollback

### 3. Problem Statement 
We need infrastructure modules to be pulled by the driver pipeline to be consistent to a standard format so that it can execute them in one job and push their states to output repos.

### 4. Solution 

The solution is to pack the CI, CD, and destroy scripts consuming terraform module in ansible playbooks and provide the consistent interface to driver repo.

#### Technology Stack

* Ansible
* Bash
* Terraform

##### Infrastructure

This project can be run from any type of host with no platform restrictions. However, it was originally intended to be used by a Jenkins job.

### 5. Usage 

#### Running

0. You need to install ansible and terraform first, or use this docker image
```
$ docker run -it -v ${PWD}:/tmp stakater/pipeline-tools:1.0 sh
$ cd /tmp
```

1. Run these,

```
$ mkdir -p build
$ touch tfvars.sh
```

2. Edit `tfvars.sh`, paste, and modify the following as needed.

_Note: S3 backend bucket needs to be created first._

```
export TF_VAR_stack_name_prefix="stakater"
export TF_VAR_environment="dev"
export TF_VAR_vpc_id="vpc-4065a326"
export TF_VAR_vpc_cidr="10.241.0.0/16"
export TF_VAR_private_subnet_ids="subnet-a051b7c6,subnet-ae15e0e6,subnet-a20e2cf9"
export TF_VAR_region="eu-west-1"
export TF_VAR_s3_bucket="449074299682-stakater-dev-state-store"

export TF_VAR_database_name="stakater123"
export TF_VAR_database_username="root"
export TF_VAR_subnet_ids="subnet-a051b7c6,subnet-a20e2cf9,subnet-ae15e0e6"
```

3. Run `ansible-playbook configure.yaml create.yaml`

#### Delete

Run `ansible-playbook configure.yaml delete.yaml`

### 6. Help 

**Got a question?** 
File a GitHub [issue](https://github.com/stakater/terraform-module-aurora-db/issues), send us an [email](stakater@gmail.com).

### 7. Contributing 


#### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/stakater/terraform-module-aurora-db/issues) to report any bugs or file feature requests.

#### Developing

PRs are welcome. In general, we follow the "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

NOTE: Be sure to merge the latest from "upstream" before making a pull request!

### 8. Changelog 

View our closed [Pull Requests](https://github.com/stakater/terraform-module-aurora-db/pulls?q=is%3Apr+is%3Aclosed).

### 9. License 

Apache2 © [Stakater](https://stakater.com)
