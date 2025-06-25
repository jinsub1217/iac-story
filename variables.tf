variable "project_id" {
    description = "project id"
    type        = string
    default     = "rising-field-463604-f3"
}

variable "region" {
    description = "adress region"
    type        = string
    default     = "asia-northeast3"
}

variable "zone" {
    description = "name of zone"
    type        = string
    default     = "asia-northeast3-a"
}

variable "address_name" {
    description = "adress name"
    type        = string
    default     = "my-static-ip"
}

variable "firewall_name" {
    description = "firewall name"
    type        = string
    default     = "ssh-allow-test"
}

variable "ssh_port" {
    description = "ssh number"
    type        = number
    default     = "8022"
}

variable "target_tags" {
    description = "name of target tag"
    type        = list(string)
    default     = ["ssh-allow-test"]
}

variable "instance_name" {
    description = "name of instance name"
    type        = string
    default     = "test1"
}

variable "machine_type" {
    description = "name of machine type"
    type        = string
    default     = "e2-medium"
}

variable "instance_image" {
    description = "name of instance image"
    type        = string
    default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "instance_size" {
    description = "name of instance size"
    type        = number
    default     = 30
}

variable "instance_type" {
    description = "name of instance type"
    type        = string
    default     = "pd-ssd"
}

variable "instance_tags" {
    description = "name of instance tags"
    type        = list(string)
    default     = ["http-server", "https-server", "ssh-allow-test"]
}