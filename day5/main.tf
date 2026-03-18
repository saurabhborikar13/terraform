terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {

}

variable "container_config" {
  type = list(object({
    name = string
    port = number
  }))

  default = [
    { name = "web1", port = 8081 },
    { name = "web2", port = 8082 },
    { name = "web3", port = 8083 }
  ]
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  for_each = {
    for c in var.container_config : c.name => c
  }
  name  = each.value.name
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = each.value.port
  }
}


output "container_urls" {
  value = [
    for c in var.container_config :
    "http:\\localhost:${c.port}"
  ]
}