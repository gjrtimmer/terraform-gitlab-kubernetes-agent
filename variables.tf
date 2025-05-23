# code: language=hcl
variable "gitlab_token" {
  type        = string
  description = "GitLab API token"
  sensitive   = true
}

variable "context" {
  type        = string
  description = "Kubernetes Context"
  default     = "default"
}
