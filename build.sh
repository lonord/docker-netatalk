#!/bin/bash

VERSION=1.0

CWD="$( cd "$( dirname "$0"  )" && pwd  )"
cd $CWD

docker build -t lonord/netatalk:$VERSION -t lonord/netatalk:latest .
