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

```tf
module "rds_cluster" {
  source = "git::https://github.com/nitinda/terraform-module-aws-rds-cluster.git?ref=terraform-12/master"


}
```


---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|:---:|
| **_tags_** | _Resource tags_ | _map(string)_ | **_Required_** |
| **_engine_** | The name of the database engine | string |
| **_engine\_mode_** | The database engine mode | string |
| **_database\_name_** | Catabase name | string |
| **_db\_cluster\_identifier\_prefix_** | Creates a unique cluster identifier | string |
| **_master\_username_** | Username for the master DB | string |
| **_master\_password_** | Password for the master DB | string |
| **_storage\_encrypted_** | Specifies whether the DB | string |
| **_skip\_final\_snapshot_** | Determines whether a final DB snapshot | string |
| **_apply\_immediately_** | Determines whether or not any DB modify | string |
| **_db\_subnet\_group\_name_** | DB subnet group name | list |
| **_vpc\_security\_group\_ids_** | List of VPC security groups | map |
| **_db\_cluster\_parameter\_group\_name_** | A cluster parameter group | list |
| **_iam\_database\_authentication\_enabled_** | Specifies whether or mappings AWS IAM | list of map |
| **_kms\_key\_id_** | The ARN for the KMS | list of map |
| **_scaling\_configuration_** | Nested attribute with scaling | list of map |


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