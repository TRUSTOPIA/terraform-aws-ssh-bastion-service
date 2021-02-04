variable "bastion_instance_type" {
  description = "The virtual hardware to be used for the bastion service host"
  default     = "t2.micro"
}

variable "cidr_blocks_whitelist_host" {
  description = "range(s) of incoming IP addresses to whitelist for the HOST"
  type        = list(string)
  default     = []
}

variable "cidr_blocks_whitelist_service" {
  description = "range(s) of incoming IP addresses to whitelist for the SERVICE"
  type        = list(string)
  default     = []
}

variable "environment_name" {
  description = "the name of the environment that we are deploying to, used in tagging. Overwritten if var.service_name and var.bastion_host_name values are changed"
  default     = "staging"
}

variable "vpc" {
  description = "ID for Virtual Private Cloud to apply security policy and deploy stack to"
}

variable "bastion_service_host_key_name" {
  description = "AWS ssh key *.pem to be used for ssh access to the bastion service host"
  default     = ""
}

variable "public_ip" {
  default     = false
  description = "Associate a public IP with the host instance when launching"
}

variable "subnets_lb" {
  type        = list(string)
  description = "list of subnets for load balancer - availability zones must match subnets_asg"
  default     = null
}

variable "subnets_asg" {
  type        = list(string)
  description = "list of subnets for autoscaling group - availability zones must match subnets_lb"
  default     = null
}

variable "dns_domain" {
  description = "The domain used for Route53 records"
  default     = ""
}

variable "route53_zone_id" {
  description = "Route53 zoneId"
  default     = ""
}

variable "bastion_allowed_iam_group" {
  type        = string
  description = "Name IAM group, members of this group will be able to ssh into bastion instances if they have provided ssh key in their profile"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "AWS tags that should be associated with created resources"
  default     = {}
}

variable "bastion_host_name" {
  type        = string
  default     = ""
  description = "The hostname to give to the bastion instance"
}

##############################
#LB ASG variables
##############################
variable "lb_healthy_threshold" {
  type        = string
  description = "Healthy threshold for lb target group"
  default     = "2"
}

variable "lb_unhealthy_threshold" {
  type        = string
  description = "Unhealthy threshold for lb target group"
  default     = "2"
}

variable "lb_interval" {
  type        = string
  description = "interval for lb target group health check"
  default     = "30"
}

variable "lb_is_internal" {
  type        = string
  description = "whether the lb will be internal"
  default     = false
}

variable "asg_max" {
  type        = string
  description = "Max numbers of bastion-service hosts in ASG"
  default     = "2"
}

variable "asg_min" {
  type        = string
  description = "Min numbers of bastion-service hosts in ASG"
  default     = "1"
}

variable "asg_desired" {
  type        = string
  description = "Desired numbers of bastion-service hosts in ASG"
  default     = "1"
}

variable "aws_region" {
}

variable "aws_profile" {
}

variable "assume_role_arn" {
  description = "arn for role to assume in separate identity account if used"
  default     = ""
}

variable "lb_healthcheck_port" {
  description = "TCP port to conduct lb target group healthchecks. Acceptable values are 22 or 2222"
  default     = "2222"
}

variable "lb_access_logs_bucket" {
  description = "Name of the bucket to store load balancer access logs"
  default     = null
}

variable "lb_access_logs_prefix" {
  description = "Prefix to add to access logs in the bucket"
  default     = null
}

variable "bastion_vpc_name" {
  description = "define the last part of the hostname, by default this is the vpc ID with magic default value of 'vpc_id' but you can pass a custom string, or an empty value to omit this"
  default     = "vpc_id"
}

variable "container_image" {
  description = "Docker image to use for containers"
  default     = "ubuntu:16.04"
}

variable "extra_user_data_content" {
  default     = ""
  description = "Extra user-data to add to the default built-in"
}

variable "extra_user_data_content_type" {
  default     = "text/x-shellscript"
  description = "What format is content in - eg 'text/cloud-config' or 'text/x-shellscript'"
}

variable "extra_user_data_merge_type" {
  # default     = "list(append)+dict(recurse_array)+str()"
  default     = "str(append)"
  description = "Control how cloud-init merges user-data sections"
}

variable "custom_ssh_populate" {
  description = "any value excludes default ssh_populate script used on container launch from userdata"
  default     = ""
}

variable "custom_authorized_keys_command" {
  description = "any value excludes default Go binary iam-authorized-keys built from source from userdata"
  default     = ""
}

variable "custom_docker_setup" {
  description = "any value excludes default docker installation and container build from userdata"
  default     = ""
}

variable "custom_systemd" {
  description = "any value excludes default systemd and hostname change from userdata"
  default     = ""
}

variable "custom_ami_id" {
  description = "id for custom ami if used"
  default     = ""
}

variable "ebs_root_size" {
  description = "Volume size of the EC2 root EBS (in GB)"
  default     = 8
}

variable "ebs_root_type" {
  description = "Volume type of the EC2 root EBS (standard, gp2, or io1)"
  default     = "standard"
}

variable "ebs_root_encryption" {
  description = "Enable/disable encryption on the EC2 root EBS"
  default     = false
}

variable "security_groups_additional" {
  description = "additional security group IDs to attach to host instance"
  type        = list(string)
  default     = []
}

variable "security_group_egress_cidr_blocks" {
  description = "CIDR blocks for security group egress rule"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "service_name" {
  description = "Unique name per vpc for associated resources- set to some non-default value for multiple deployments per vpc"
  default     = "bastion-service"
}

variable "route53_fqdn" {
  description = "If creating a public DNS entry with this module then you may override the default constructed DNS entry by supplying a fully qualified domain name here which will be used verbatim"
  default     = ""
}

