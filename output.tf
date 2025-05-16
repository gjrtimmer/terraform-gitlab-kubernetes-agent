# code: language=hcl
output "gitlab_agent_token" {
  value     = module.gitlab-agent[0].gitlab_agent_token
  sensitive = true
}
