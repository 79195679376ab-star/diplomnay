#!/bin/bash

# Получаем IP бастиона (простой тип — работает с -raw)
BASTION_IP=$(terraform output -raw bastion_ip)

# Генерируем inventory
cat > inventory.yml <<EOT
all:
  vars:
    ansible_user: ubuntu
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q ubuntu@$BASTION_IP"'

  children:
    web_servers:
      hosts:
$(for ip in $(terraform output -json web_servers_ips | jq -r '.[]'); do
  echo "        $ip:"
done)
    monitoring:
      children:
        prometheus:
          hosts:
            $(terraform output -raw prometheus_ip):
        grafana:
          hosts:
            $(terraform output -raw grafana_ip):
    bastion:
      hosts:
        $BASTION_IP:
    elasticsearch:
      hosts:
        $(terraform output -raw elasticsearch_ip):
    kibana:
      hosts:
        $(terraform output -raw kibana_ip):
EOT

echo "Inventory generated successfully!"
