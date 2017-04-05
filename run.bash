#!/bin/bash

/bin/cp -a inventario/${1} ~/.ssh/config
/bin/chmod 400 inventario/llaves/*
mkdir PET
echo ${1}
