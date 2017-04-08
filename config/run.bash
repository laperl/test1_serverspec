#!/bin/bash

SSHCONFIGFILE=${1}
SSHCONFIGFILE=${2}
ENTORNO=${3}
USUARIO=${4}
CERTIFICADO=${5}
IPDESTINO=${6}

/bin/cp ${ENTORNO}/inventario/${SSHCONFIGFILE} ~/.ssh/config || exit 1
/bin/cp ${ENTORNO}/inventario/llaves/* ~/.ssh/ || exit 1
/bin/chmod 400 ~/.ssh/*key || exit 1
#scp -i inventario/llaves/maquinatest.dcip_epg_ost.cloud.key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -r inventario cloud-user@dcip-testing:~
#scp -i inventario/llaves/maquinatest.dcip_epg_ost.cloud.key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -rv inventario dcip-testing:~
#eval `ssh-agent -s`
#ssh-add inventario/llaves/maquinatest.dcip_epg_ost.cloud.key
cd ${ENTORNO}/config
rake spec

