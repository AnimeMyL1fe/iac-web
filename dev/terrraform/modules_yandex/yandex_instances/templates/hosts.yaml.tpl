dev:
  children: #Обозначение, что будет подгруппа хостов
    some_group: #Имя подгруппы хостов
      hosts: 
%{for name, vm in vms ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
          your_variable: "значение" #Переменная, которая будет доступна при работе с этой машиной
%{  endfor ~}
  vars:
    ansible_user: ${ans_user}
    ansible_ssh_private_key_file: ${ans_ssh_key} 
    connection_protocol: ssh
    ansible_become: true 