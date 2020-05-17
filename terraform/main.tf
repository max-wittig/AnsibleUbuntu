variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

locals {
  ssh_keys = split("\n", file(var.ssh_keys_file))
}

resource "digitalocean_ssh_key" "default" {
  name       = split(" ", local.ssh_keys[count.index])[2]
  count      = length(local.ssh_keys)
  public_key = local.ssh_keys[count.index]
}

resource "digitalocean_droplet" "web" {
  image      = "39342610" # ubuntu-18.10
  name       = "ubuntu-20-03"
  region     = "fra1"
  size       = "s-1vcpu-1gb"
  monitoring = "false"
  ipv6       = "true"
  ssh_keys   = local.ssh_keys
}
