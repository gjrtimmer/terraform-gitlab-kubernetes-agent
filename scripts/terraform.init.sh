#!/usr/bin/env bash
rm -rf ./.terraform
rm -rf ./.terraform.lock.hcl

# Prompt the user for input
echo "Terraform Init"
echo
read -rp    "Enter the GitLab Username                   : " GITLAB_USERNAME
read -rsp   "Enter the GitLab Token (Secret)             : " GITLAB_ACCESS_TOKEN
echo

# Create or overwrite the .env file
cat << EOF > .env
export TF_VAR_gitlab_token=${GITLAB_ACCESS_TOKEN}
export GITLAB_PROJECT_ID=68926829
export TF_STATE_NAME=gitlab-agents
EOF

echo ".env file created successfully!"

# shellcheck disable=SC1091
source .env

terraform init \
    -backend-config="address=https://gitlab.com/api/v4/projects/$GITLAB_PROJECT_ID/terraform/state/$TF_STATE_NAME" \
    -backend-config="lock_address=https://gitlab.com/api/v4/projects/$GITLAB_PROJECT_ID/terraform/state/$TF_STATE_NAME/lock" \
    -backend-config="unlock_address=https://gitlab.com/api/v4/projects/$GITLAB_PROJECT_ID/terraform/state/$TF_STATE_NAME/lock" \
    -backend-config="username=$GITLAB_USERNAME" \
    -backend-config="password=$GITLAB_ACCESS_TOKEN" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5"
