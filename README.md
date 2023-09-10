# Ansible Configuration and Playbooks Repository

## Introduction

Welcome to my Ansible Configuration and Playbooks repository. In addition to general system administration tasks, this repository serves as a hub for deploying containers and VMs in my Proxmox cluster. As a Solutions Architect with a strong focus on DevOps, these playbooks are designed to solve real-world challenges in modern, distributed systems.

## Features

- 🛠 System setup for LXC containers
- 🔒 SSH Key management
- 📦 Package management and system updates
- 💻 Custom shell configurations
- 📈 Monitoring and logging configurations
- 🔄 CI/CD pipeline automation

## Requirements

- Ansible 2.x or higher
- SSH access to target nodes
- Linux-based control node
- Proxmox cluster access (optional)
  
## Installation

1. Clone this repository:

    \```bash
    git clone https://github.com/yourusername/ansible-configs.git
    \```

2. Navigate to the directory:

    \```bash
    cd ansible-configs
    \```

3. Update the `inventory.ini` with the target node information.

## Usage

To run a playbook, simply execute:

\```bash
ansible-playbook -i inventory.ini playbook_name.yml
\```

## Contributing

If you have suggestions or improvements, feel free to fork this repository and create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.
