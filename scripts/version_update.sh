#!/bin/bash -en
#
# Update CURRENT_PROJECT_VERSION if needed
# Force to update versions of ALL packages (main, test, uitest)
#
# Versioning example
#   MARKETING_VERSION: 1.1.3
#   CURRENT_PROJECT_VERSION: 10103
#
# Usage:
#   0. update version of your 'main' project in xcode
#   1. bash version_update.sh
#
set -e

PROGRAM=$(basename "$0")
FILE_NAME="TwitterClone.xcodeproj/project.pbxproj"
BACKUP_FILE_NAME="${FILE_NAME}.${PROGRAM}.backup"
# make a backup just in case
cp "${FILE_NAME}" "${BACKUP_FILE_NAME}"

function recover_from_backup() {
    EXIT_CODE="$?"
    if [[ "$EXIT_CODE" > 0 ]]; then
        echo "Something went wrong."
        rm "${FILE_NAME}"
        mv "${BACKUP_FILE_NAME}" "${FILE_NAME}"
        echo "recovered from backup"
    else
        rm "${BACKUP_FILE_NAME}"
    fi
    # sed in mac creates a default backup file??
    BACKUP_FILE_BY_MAC="${FILE_NAME}-e"
    if [[ -f "${BACKUP_FILE_BY_MAC}" ]]; then
        rm "${BACKUP_FILE_BY_MAC}"
    fi
}
# "trap recover_from_backup ERR" not working on my mac ??
# ERR is special feature to bash
trap recover_from_backup EXIT

# e.g) TRUE_VERSION: 1.0.1
TRUE_VERSION="$(cat ${FILE_NAME} | grep MARKETING_VERSION | head -n1 | sed -E 's@.*= (.*);@\1@')"
CURRENT_PROJECT_VERSION="$(echo ${TRUE_VERSION} | awk -F'.' '{print $1*10000 + $2*100 + $3}')"

sed -i -e \
    "s@MARKETING_VERSION = .*;@MARKETING_VERSION = ${TRUE_VERSION};@g" \
    "${FILE_NAME}"

# e.g) CURRENT_PROJECT_VERSION: 10001 <- 1*10000 + 0*100 + 1
CURRENT_PROJECT_VERSION="$(echo ${TRUE_VERSION} | awk -F'.' '{print $1*10000 + $2*100 + $3}')"
sed -i -e \
    "s@CURRENT_PROJECT_VERSION = .*;@CURRENT_PROJECT_VERSION = ${CURRENT_PROJECT_VERSION};@g" \
    "${FILE_NAME}"
