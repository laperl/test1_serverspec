Execucio
========
docker run -ti --rm -v "$HOME/.ssh/config":/root/.ssh/config -v "$HOME/.ssh/known_hosts":/root/.ssh/known_hosts -v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent:ro -e SSH_AUTH_SOCK=/ssh-agent --hostname="serverspec" --name "serverspec" -v ${HOME}/Documents/REPOGIT/ServerSpec/:/root/ServerSpec:ro jaume/serverspec

# Mapejo el directori on hi han els playbooks en local pero nomes RO.
# -v "$HOME/.ssh/config":/root/.ssh/config --> Pq agafi els hosts definits dins de config !!! :)
# -v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent:ro -e SSH_AUTH_SOCK=/ssh-agent  --> Pq mapeji tots els certs de la base ReadOnly
# -v "$HOME/.ssh/known_hosts":/root/.ssh/known_hosts --> Pq no faci el check del host cada vegada farem que pugui escriure en el known_hosts LOCAL

# Per fer-ho funcionar amb servidors arbitraris haurem de posar la clau ssh en el servidor pare ja que mapejem les claus del agent

