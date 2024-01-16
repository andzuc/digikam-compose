#!/bin/bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${MYDIR}/.."

source .env
if ! docker volume inspect "${DIGIKAM_CONFIG}" >/dev/null 2>&1 ; then
    echo docker volume create "${DIGIKAM_CONFIG}"
    docker volume create "${DIGIKAM_CONFIG}"
fi
docker volume inspect "${DIGIKAM_CONFIG}"

docker compose up -d
echo "Open digiKam URL: http://localhost:${KASMVNC_PORT}"
