# Ansible Repository Guidelines for Proxmox LXC Management

## Commands

```bash
# Lint Ansible playbooks and roles
pip install ansible-lint  # Install if not available
ansible-lint ./*.yml      # Lint all YAML files in root
ansible-lint playbooks/*.yml  # Lint playbooks directory

# Run a playbook with dynamic inventory
source .env && ansible-playbook -i proxmox.yaml playbooks/PLAYBOOK_NAME.yml

# Run a playbook with limit to specific LXC containers
source .env && ansible-playbook -i proxmox.yaml playbooks/PLAYBOOK_NAME.yml --limit 'CONTAINER_TAG'

# Run playbook with increased parallelism (for many containers)
source .env && ansible-playbook -i proxmox.yaml playbooks/PLAYBOOK_NAME.yml -f 20

# Syntax check without running
ansible-playbook -i proxmox.yaml playbooks/PLAYBOOK_NAME.yml --syntax-check
```

## Code Style Guidelines

- **YAML Indentation**: Use 2 spaces for indentation in all YAML files
- **Task Naming**: All tasks should have descriptive names in sentence case
- **Variables**: Use snake_case for all variables
- **Tags**: Tag tasks with container-specific tags (lxc, debian, etc.) for selective execution
- **Parallelism**: Set appropriate serial/forks parameters for LXC container batches
- **Idempotence**: Ensure all tasks are idempotent for safe container management
- **LXC Groups**: Use proxmox_tags_parsed to create dynamic container groups
- **APT Caching**: Leverage apt-cacher-ng for faster package operations
- **Facts Caching**: Enable fact caching for faster inventory processing
- **Handlers**: Use handlers for service management across containers
- **Timeouts**: Set appropriate timeouts for container operations