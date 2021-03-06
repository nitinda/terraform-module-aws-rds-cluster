# _Terraform Module: terraform-module-aws-rds-cluster_


## _General_

_This module can be used to deploy a_ _**RDS Cluster** on AWS Cloud Provider......_


---

## _Prerequisites_

_This module needs **Terraform 0.12.20** or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).



---

## _Features Branches_

_Below we are able to check the resources that are being created as part of this module call:_

- _**RDS Cluster**_


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

* _**Example Postgresql RDS**_

```tf
module "rds_cluster" {
  source = "git::https://github.com/nitinda/terraform-module-aws-rds-cluster.git?ref=master"

  providers = {
    aws = aws.services
  }

  # Tags
  tags = {
    Project      = "POC"
    Owner        = "Platform Team"
    Environment  = "prod"
    BusinessUnit = "Platform Team"
    ManagedBy    = "Terraform"
    Application  = "RDS Cluster Parameter Group"
  }

  # RDS
  engine                               = "aurora-postgresql"
  engine_version                       = "9.6.9"
  engine_mode                          = "provisioned"
  database_name                        = "postgresql"
  cluster_identifier_prefix            = "postgresql-cluster"
  master_username                      = "postgresql"
  master_password                      = "postgresql123"
  db_subnet_group_name                 = var.db_subnet_group_name
  db_cluster_parameter_group_name      = var.db_cluster_parameter_group_name
  vpc_security_group_ids               = var.vpc_security_group_ids
  port                                 = 5432
}
```

* _**Example Postgresql RDS with Serverless**_


```tf
module "rds_cluster" {
  source = "git::https://github.com/nitinda/terraform-module-aws-rds-cluster.git?ref=master"

  providers = {
    aws = aws.services
  }

  # Tags
  tags = {
    Project      = "POC"
    Owner        = "Platform Team"
    Environment  = "prod"
    BusinessUnit = "Platform Team"
    ManagedBy    = "Terraform"
    Application  = "RDS Cluster Parameter Group"
  }

  # RDS
  engine                               = "aurora-postgresql"
  engine_version                       = "9.6.9"
  engine_mode                          = "serverless"
  database_name                        = "postgresql"
  cluster_identifier_prefix            = "postgresql-cluster"
  master_username                      = "postgresql"
  master_password                      = "postgresql123"
  storage_encrypted                    = true
  db_subnet_group_name                 = var.db_subnet_group_name
  db_cluster_parameter_group_name      = var.db_cluster_parameter_group_name
  vpc_security_group_ids               = var.vpc_security_group_ids
  port                                 = 5432
  kms_key_id                           = var.kms_key_id_arn
}
```

---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Comments_** |
|:----|:----|-----:|:---:|
| **_engine_** | _The name of the database engine_ | _string_ | **_Required_** |
| **_engine\_mode_** | _The database engine mode_ | _string_ | **_Required_** |
| **_engine\_version_** | _The database engine mode_ | _string_ | **_Required_** |
| **_database\_name_** | _Database Name_ | _string_ | **_Required_** |
| **_db\_cluster\_identifier\_prefix_** | _Creates a unique cluster identifier_ | _string_ | **_Required_** |
| **_copy\_tags\_to\_snapshot_** | _Copy all Cluster tags to snapshots_ | _string_ | **_Optional (Default false)_** |
| **_master\_username_** | _Username for the master DB_ | _string_ | **_Required_** |
| **_master\_password_** | _Password for the master DB_ | _string_ | **_Required_** |
| **_storage\_encrypted_** | _Specifies whether the DB_ | _bool_ | **_Optional (Default false)_** |
| **_skip\_final\_snapshot_** | _Determines whether a final DB snapshot_ | _bool_ | **_Optional (Default false)_** |
| **_apply\_immediately_** | _Determines whether or not any DB modify_ | _bool_ | **_Optional (Default false)_** |
| **_db\_subnet\_group\_name_** | _DB subnet group name_ | _list(string)_ | **_Required_** |
| **_vpc\_security\_group\_ids_** | _List of VPC security groups ids_ | _list(string)_ | **_Required_** |
| **_db\_cluster\_parameter\_group\_name_** | _RDS cluster parameter group_ | _string_ | **_Required_** |
| **_iam\_database\_authentication\_enabled_** | _Specifies whether or mappings AWS IAM_ | _bool_ | **_Optional (Default false)_** |
| **_kms\_key\_id_** | _The ARN for the KMS encryption key_ | _string_ | **_Optional (Default null)_** |
| **_scaling\_configuration_** | _Nested attribute with scaling_ | _any_ | **_Optional (Default [])_** |
| **_tags_** | _Resource tags_ | _map(string)_ | **_Required_** |


---


## _Outputs_

### _General_

_This module has the following outputs:_

* **_endpoint_**
* **_id_**
* **_arn_**
* **_database\_name_**
* **_engine_**
* **_master\_username_**


### _Usage_

_In order for the variables to be accessed at module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```


_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<layer_name>.<output_variable_name>
```

---



## _Authors_

_Module maintained by Module maintained by the -_ **_Nitin Das_**