#!/bin/sh

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${TARGET}" ]; then
    echo "TARGET is missing"
    TARGET = "default"
fi

if [ -z "${WORKING_DIRECTORY}" ]; then
    echo "WORKING_DIRECTORY is missing"
else
    cd ${WORKING_DIRECTORY}
fi

firebase use ${TARGET}

firebase deploy --token ${FIREBASE_TOKEN} --only functions
