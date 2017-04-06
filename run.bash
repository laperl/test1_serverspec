#!/bin/bash

/bin/cp inventario/${1} ~/.ssh/config || exit 1
/bin/chmod 400 inventario/llaves/* || exit 1
#scp -i inventario/llaves/maquinatest.dcip_epg_ost.cloud.key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -r inventario cloud-user@dcip-testing:~
scp -i inventario/llaves/maquinatest.dcip_epg_ost.cloud.key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -rv inventario dcip-testing:~
cd config
ls -lR ~/.s*
ssh -v dcip-testing
rake spec
