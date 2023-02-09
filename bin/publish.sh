#!/usr/bin/env sh

set -e

bin="`dirname "$0"`"
root="$bin/.."

name="`basename "$(realpath "$root")"`"
image="$FLUX_PUBLISH_DOCKER_USER/$name"

"$bin/build.sh"

export DOCKER_CONFIG="$FLUX_PUBLISH_DOCKER_CONFIG_FOLDER"
docker push "$image:latest"
unset DOCKER_CONFIG

update-github-metadata "$root"
