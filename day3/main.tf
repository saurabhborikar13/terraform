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

#pulling nginx image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

#create container
resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx_image.image_id

  ports {
    internal = 80
    external = 8080
  }
}

output "container_url" {
  value = "http://localhost:8080"
}