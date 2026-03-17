#this is going to be the tempplate like the function which i +s getting called again and again
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
variable "container_name" {
  type=string
}
variable "container_port" {
  type =number
}
variable "image_name"{
    type=string
}

resource "docker_image" "nginx_image" {
    name=var.image_name
}
resource "docker_container" "nginx_container" {
    name=var.container_name
    image=docker_image.nginx_image.image_id
    ports {
      internal = 80
      external = var.container_port
    }
}
