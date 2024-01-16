#!/bin/bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${MYDIR}/.."

export DIGIKAM_CONFIG=digikam_config
if ! docker volume inspect "${DIGIKAM_CONFIG}" >/dev/null 2>&1 ; then
    echo docker volume create "${DIGIKAM_CONFIG}"
    docker volume create "${DIGIKAM_CONFIG}"
fi
docker volume inspect "${DIGIKAM_CONFIG}"

docker compose up -d
