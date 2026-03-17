terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "2.4.0"
    }
  }
}

provider "local" {
  
}

variable "filename" {
    description = "Name of the file"
    type = string
  
}

variable "message" {
  description = "content inside hte file"
  type = string
}   

resource "local_file" "env_file" {
  filename = var.filename
  content = var.message
}

output "file_created" {
  value = var.filename
}