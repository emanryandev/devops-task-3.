terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  # الاتصال بمحرك Docker المحلي
}

# 1. سحب الصورة (Image) من Docker Hub
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false
}

# 2. إنشاء وتشغيل الحاوية (Container)
resource "docker_container" "nginx_server" {
  image = docker_image.nginx_image.image_id
  name  = "devops_task_3_container"
  ports {
    internal = 80
    external = 8080
  }
}
