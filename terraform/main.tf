variable "do_token" {
}

provider "digitalocean" {
  token = var.do_token
}

locals {
  ssh_keys = split("\n", file("../ansible/roles/user/files/ssh_keys.txt"))
}

resource "digitalocean_ssh_key" "default" {
  name       = split(" ", local.ssh_keys[count.index])[2]
  count      = length(local.ssh_keys)
  public_key = local.ssh_keys[count.index]
}

resource "digitalocean_droplet" "web" {
  image      = "39342610" # ubuntu-18.10
  name       = "ubuntu-19-10"
  region     = "fra1"
  size       = "s-1vcpu-1gb"
  monitoring = "false"
  ssh_keys   = local.ssh_keys
}

resource "digitalocean_domain" "default" {
  name       = "maxwittig.xyz"
  ip_address = digitalocean_droplet.web.ipv4_address
}
