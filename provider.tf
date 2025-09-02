# code: language=hcl
terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
    }
  }

  backend "http" {}
}

provider "gitlab" {
  # Configuration options
  base_url = "https://gitlab.com/api/v4/"
  token    = var.gitlab_token
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = var.context
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
