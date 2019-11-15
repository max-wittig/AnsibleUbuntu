variable "domain" {
  type    = string
  default = "maxwittig.xyz"
}

variable "ssh_keys_file" {
  type    = string
  default = "../ansible/roles/user/files/ssh_keys.txt"
}
