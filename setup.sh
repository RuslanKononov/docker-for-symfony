#!/bin/bash

# Quit on error.
set -e
# Treat undefined variables as errors.
set -u


function main {
    local mod_uid="${1:-}"
    local mod_gid="${2:-}"
    local mod_name="${3:-}"

    # Change the uid
    if [[ -n "${mod_uid:-}" ]]; then
        usermod --non-unique -u "${mod_uid}" ${mod_name}
    fi
    # Change the gid
    if [[ -n "${mod_gid:-}" ]]; then
        groupmod --non-unique -g "${mod_gid}" ${mod_name}
    fi

}

main "$@"
