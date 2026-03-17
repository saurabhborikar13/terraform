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

#first conatiner
module "nginx1" {
  source         = "./moduels/nginx_container"
  container_name = "nginx1"
  container_port = 8081
  image_name     = "nginx:latest"
}

#second conatiner
module "nginx2" {
  source         = "./moduels/nginx_container"
  container_name = "nginx2"
  container_port = 8082
  image_name     = "nginx:latest"
}
