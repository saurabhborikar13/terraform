terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }
}


provider "local" {}

variable "message" {
  description = "Messsage to write into file new"
  type        = string
  default     = "Hello from Terraform" 
}


resource "local_file" "hello_file" {
  filename = "hello.txt"
  content  = var.message
}

output "file_path" {
  description = "Path of the created file"
  value       = local_file.hello_file.filename
}