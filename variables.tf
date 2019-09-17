variable "name" {
  type = string
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "network" {
  type = string
}

variable "instances" {
  type    = list(string)
  default = null
}

variable "load_balancing_scheme" {
  type    = string
  default = "EXTERNAL"
}

variable "service_port" {
  type = number
}

variable "source_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "target_tags" {
  type = list(string)
}

variable "session_affinity" {
  type    = string
  default = "CLIENT_IP"
}
