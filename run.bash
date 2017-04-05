#!/bin/bash

/bin/cp inventario/${1} ~/.ssh/config || exit 1
/bin/chmod 400 inventario/llaves/* || exit 1
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -r cloud-user@dcip-testing:~ inventario
