#!/bin/bash

apps=(
  commitizen
)

for app in ${apps[@]}; do
  npm install ${app} -g
done
