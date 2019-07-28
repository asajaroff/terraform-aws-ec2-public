# terraform-aws-ec2-public

## Requirements
|       Variable      |          Description          |   Type   |         Default Value        | Required |
|:-------------------:|:-----------------------------:|:--------:|:----------------------------:|:--------:|
|     application     | Application name              | `string` |             `app`            |    yes   |
|      namespace      | Namespace for the Application | `string` |             `ns`             |    yes   |
|     environment     | Environment type              | `string` |           `testing`          |    yes   |
|      cidr_block     | CIDR Block (/16)              | `string` |         `10.0.0.0/16`        |    no    |
|         azs         | List of Availability Zones    |  `list`  | `"us-east-1a", "us-east-1b"` |    no    |
|    key_pair_name    | Name of the SSH key           | `string` |            `none`            |    yes   |
|  public_subnet_cidr | CIDR for the Public Subnet    | `string` |         `10.0.0.0/24`        |    yes   |
| private_subnet_cidr | CIDR for the Private Subnet   | `string` |         `10.0.1.0/24`        |    no    |
## Post Provision Steps
1.  Add your IP Address to the `web` security group for SSH access.
2.  Execute:
```bash
sudo apt update && sudo apt upgrade
wget get.docker.com --output-file docker-install.sh
chmod +x docker-install.sh
sh docker-install.sh
sudo usermod -aG docker admin
```