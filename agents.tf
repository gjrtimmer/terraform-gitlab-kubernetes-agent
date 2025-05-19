# code: language=hcl
module "gitlab-agent" {
  source = "github.com/sparkfabrik/terraform-gitlab-kubernetes-gitlab-agent?ref=main"
  count  = length(local.config.agents)

  create_namespace  = try(local.config.agents[count.index].namespace.create, true)
  namespace         = try(local.config.agents[count.index].namespace.name, "gitlab-agent")
  helm_release_name = "gitlab-agent"

  agent_replicas = try(local.config.agents[count.index].replicas, 1)

  gitlab_agent_name                       = local.config.agents[count.index].name
  gitlab_project_path_with_namespace      = local.config.agents[count.index].repository.path
  gitlab_agent_custom_config_file_content = try(file("${path.module}/${local.config.agents[count.index].config}"), file("${path.module}/config/${local.config.agents[count.index].name}.yml"))
  gitlab_agent_branch_name                = try(local.config.agents[count.index].repository.branch, "main")
  gitlab_agent_token_description          = "Gitlab Agent Token for gitlab.com"
  gitlab_agent_commmit_message            = "ops: add/update config for agent: {{gitlab_agent_name}}"
  helm_chart_version                      = "2.14.1"
}
