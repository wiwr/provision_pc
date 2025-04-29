#!/bin/bash

REPO_URL="https://github.com/wiwr/provision_pc.git"
REPO_DIR="/home/witek/povision_pc"

GIT_INSTALLED=$(command -v git)
ANSIBLE_INSTALLED=$(command -v ansible)
#VAULT_PASSWORD_FILE="../vault-pass.txt"

if [[ -n "$GIT_INSTALLED" && -n "$ANSIBLE_INSTALLED" ]]; then
	echo "Git and Ansible are already installed"
	echo "Skipping updated..."
	echo "Skipping installation..."
else
        apt update && apt upgrade -y
        apt install -y git ansible
fi

rm -rf "$REPO_DIR"
git clone "$REPO_URL" "$REPO_DIR"

cd "$REPO_DIR"
ansible-playbook playbook.yml #--vault-password-file "$VAULT_PASSWORD_FILE"

