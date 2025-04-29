# code: language=hcl
module "ga_gitlab_com" {
  source = "github.com/sparkfabrik/terraform-gitlab-kubernetes-gitlab-agent?ref=main"

  create_namespace  = true
  namespace         = "gitlab-agent"
  helm_release_name = "gitlab-agent"

  agent_replicas = 2


  gitlab_agent_name                       = "gitlab-com"
  gitlab_project_path_with_namespace      = "k3s-tpi/gitlab-agents"
  gitlab_agent_custom_config_file_content = file("${path.module}/config/gitlab.com.yml")
  gitlab_agent_branch_name                = "main"
  gitlab_agent_token_description          = "Gitlab Agent Token for gitlab.com"
  gitlab_agent_commmit_message            = "ops: add/update config for agent: {{gitlab_agent_name}}"
  helm_chart_version                      = "2.14.1"
}
