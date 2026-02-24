variable "token" {
  description = "y0__xDF2J9tGMHdEyCxt7fDFGJzX3alGqL9QMjJ2qVj37ohuqgK"
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  description = "bpfvtikp4bpuepstok19"
  type        = string
}

variable "folder_id" {
  description = "b1g5p6ecne1kfv76pai6"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
variable "image_id_ya" {
  type        = string
  description = "ID образа для виртуальных машин"
  default     = "fd81clpjdoco1a0kah16"
}
