resource "digitalocean_droplet" "rancher" {
  image = "rancheros"
  name = "do-prod-web"
  region = "sgp1"
  size = "s"
  ipv4_address_private = "true"
  user_data = <<EOF
#!/bin/bash
sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server
EOF
}

resource "digitalocean_volume" "rancher" {
  name = "rancher-store"
  region = "sgp1"
  size = 50gb
}

