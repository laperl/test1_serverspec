#!/bin/bash

pwd
/bin/cp inventario/${1} ~/.ssh/config || exit 1
/bin/cp inventario/llaves/* ~/.ssh/ || exit 1
/bin/chmod 400 ~/.ssh/*key || exit 1
#scp -i inventario/llaves/maquinatest.dcip_epg_ost.cloud.key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -r inventario cloud-user@dcip-testing:~
#scp -i inventario/llaves/maquinatest.dcip_epg_ost.cloud.key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -rv inventario dcip-testing:~
#ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
#eval `ssh-agent -s`
#ssh-add inventario/llaves/maquinatest.dcip_epg_ost.cloud.key
cd config
rake spec
