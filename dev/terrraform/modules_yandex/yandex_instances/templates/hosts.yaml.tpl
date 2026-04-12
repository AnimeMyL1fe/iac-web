dev:
  children: 
#-------------WEB_SERVERS_GROUP-----------------
    web_servers: 
      hosts: 
%{for name, vm in vms ~}
%{ if length(regexall("mediawiki", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
          db_host: ${mw_db_internal_ip}
%{ endif ~}
%{ endfor ~}

    lb_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("lb", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
%{ endif ~}
%{ endfor ~}
      #-------ZABBIX_GROUP----------- 



  vars:
    ansible_user: ${ans_user}
    ansible_ssh_private_key_file: ${ans_ssh_key} 
    connection_protocol: ssh
    ansible_become: true 