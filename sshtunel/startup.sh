#!/bin/sh
if [ -z "$REMOTE_GW" ] || [ -z "$REMOTE_HOST" ] || [ -z "$USER" ] ; then
    echo "debe configurar las variables de entorno REMOTE_GW REMOTE_HOST y USER"
    exit 1
fi
if [ -f "/root/.ssh/id_rsa" ]; then
    chmod 600 /root/.ssh/id_rsa
    if  [ ! -f "/root/.ssh/known_hosts" ] ; then
        echo "agregando $REMOTE_GW a known_hosts"
        ssh-keyscan -H $REMOTE_GW > /root/.ssh/known_hosts
    fi
    ssh -v -f -N -L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT $USER@$REMOTE_GW && while true; do sleep 30; done;
else
    echo "debe montar la llave privada ssh en /root/.ssh/id_rsa"
    exit 2
fi
