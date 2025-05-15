locals {
    config = yamldecode(file("${path.module}/config/agents.yml"))
}