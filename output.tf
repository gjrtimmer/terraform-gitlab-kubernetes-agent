# code: language=hcl
output "ga_token_gitlab_com" {
  value     = module.ga_gitlab_com.gitlab_agent_token
  sensitive = true
}
