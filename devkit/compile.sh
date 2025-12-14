#!/bin/bash

source devkit/env.sh
FINALPACKAGE=1 gmake clean package

source devkit/rootless.sh
FINALPACKAGE=1 gmake clean package

source devkit/roothide.sh
FINALPACKAGE=1 gmake clean package

# source devkit/fishhook.sh
# FINALPACKAGE=1 gmake clean package
