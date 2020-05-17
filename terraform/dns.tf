resource "digitalocean_domain" "default" {
  name       = var.domain
  ip_address = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "A" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "AAAA" {
  domain = digitalocean_domain.default.name
  type   = "AAAA"
  name   = "@"
  value  = digitalocean_droplet.web.ipv6_address
}

resource "digitalocean_record" "do1" {
  domain = digitalocean_domain.default.name
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
}

resource "digitalocean_record" "do2" {
  domain = digitalocean_domain.default.name
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
}

resource "digitalocean_record" "do3" {
  domain = digitalocean_domain.default.name
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
}
