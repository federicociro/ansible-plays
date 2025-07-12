# Ansible Repository Guidelines for Proxmox LXC Management

## Configuración de Credenciales

### Opción 1: Ansible Vault (Recomendado para producción)

1. **Crear vault:** (Se usa el archivo temporal desde .env)
   ```bash
   # Crear y encriptar de una vez
   ansible-vault encrypt /tmp/vault_temp.yml --output group_vars/all/vault.yml
   ```

2. **Editar credenciales del vault:**
   ```bash
   # Editar credenciales existentes
   ansible-vault edit group_vars/all/vault.yml
   
   # Cambiar contraseña del vault
   ansible-vault rekey group_vars/all/vault.yml
   
   # Ver contenido sin editar
   ansible-vault view group_vars/all/vault.yml
   ```

3. **Ejecutar comandos con vault:**
   ```bash
   # Probar inventario
   ansible-inventory -i inventory.proxmox.yml --list --ask-vault-pass
   
   # Ejecutar playbooks
   ansible-playbook -i inventory.proxmox.yml playbooks/PLAYBOOK.yml --ask-vault-pass
   
   # Usar archivo de contraseña
   echo "tu-password" > .vault-pass
   ansible-inventory -i inventory.proxmox.yml --list --vault-password-file .vault-pass
   ```

4. **Para cambiar tokens/credenciales:**
   ```bash
   # Editar el vault directamente
   ansible-vault edit group_vars/all/vault.yml
   ```

### Opción 2: Variables de entorno (Para desarrollo)

1. Usa tu archivo `.env` existente
2. Ejecuta: `source .env && ansible-inventory -i inventory.proxmox.yml --list`

## Commands

```bash
# Lint Ansible playbooks and roles
pip install ansible-lint  # Install if not available
ansible-lint ./*.yml      # Lint all YAML files in root
ansible-lint playbooks/*.yml  # Lint playbooks directory

# IMPORTANTE: Siempre usar 'source .env &&' antes de comandos ansible

# Probar conectividad del inventario dinámico
source .env && ansible-inventory -i inventory.proxmox.yml --list

# Run a playbook with dynamic inventory
source .env && ansible-playbook -i inventory.proxmox.yml playbooks/PLAYBOOK_NAME.yml

# Run a playbook with limit to specific LXC containers
source .env && ansible-playbook -i inventory.proxmox.yml playbooks/PLAYBOOK_NAME.yml --limit 'CONTAINER_TAG'

# Run playbook with increased parallelism (for many containers)
source .env && ansible-playbook -i inventory.proxmox.yml playbooks/PLAYBOOK_NAME.yml -f 20

# Syntax check without running
ansible-playbook -i inventory.proxmox.yml playbooks/PLAYBOOK_NAME.yml --syntax-check
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