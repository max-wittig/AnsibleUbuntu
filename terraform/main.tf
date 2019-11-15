variable "do_token" {
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web" {
  image      = "39342610" # ubuntu-18.10
  name       = "ubuntu-18.10"
  region     = "fra1"
  size       = "s-1vcpu-1gb"
  monitoring = "false"
  ssh_keys   = ["23597109", "20943250", "20980721"]
}

resource "digitalocean_domain" "default" {
  name       = "maxwittig.xyz"
  ip_address = digitalocean_droplet.web.ipv4_address
}

