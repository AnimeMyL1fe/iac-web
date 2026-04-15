dev:
  children: 
    # --- WEB SERVERS ---
    web_servers: 
      hosts: 
%{for name, vm in vms ~}
%{ if length(regexall("mw-web", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
          db_host: ${mw_db_internal_ip}
%{ endif ~}
%{ endfor ~}

    # --- MW_DB_MASTER SERVERS --- 
    mwdb_servers_master:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("mw-db-master", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
%{ endif ~}
%{ endfor ~}


    # --- MW_DB_REPLICA SERVERS --- 
    mwdb_servers_replica:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("mw-db-replica", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
%{ endif ~}
%{ endfor ~}


    # --- LB SERVERS ---
    lb_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("lb", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

      # --- ZBX SERVERS ---
    zbx-servers:
%{for name, vm in vms ~}
%{ if length(regexall("zbx", name)) > 0 ~}
      hosts:
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

  vars:
    ansible_user: ${ans_user}
    ansible_ssh_private_key_file: ${ans_ssh_key} 
    connection_protocol: ssh
    ansible_become: true 