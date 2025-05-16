# GitLab Agents Deployment

This repository holds the Terraform configuration to deploy the GitLab Kubernetes Agents. This will deploy the agents to either various clusters or it will deploy multiple agents to link multiple GitLab instances.

Regarding multiple agents within the same cluster. This will allow the cluster to be managed from multiple instances. The reason for this is so that the Cluster Management can be detached from a private GitLab instance running within the cluster.

To avoid a chicken-and-egg situation, the cluster management is kept in this private repository within GitLab.com so that the cluster can always be restored regardless the availability of the private GitLab instance within the cluster.

The second agent which is linked to the private GitLab is meant for the deployment and configuration of personal projects and to facilitate development as well as academic purposes.

## Usage

1. Copy `.config/agents.example.yml` to `config/agents.yml`
2. Configure Agents in `config/agents.yml`
3. For each agent create `config/{AGENT_NAME}.yml` in `config` using the the template: `.config/config/example.yml`
4. Run `scripts/terraform.init.sh` to initialize the repository.
5. Run `source .env`
6. Run `terraform plan`
7. Run `terraform apply`

This will deploy the agents to the active cluster within the local `.kube/config`.
