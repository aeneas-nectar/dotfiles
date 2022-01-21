#!/bin/bash


apps=(
  commitizen
  ipt
)

for app in ${apps[@]}; do
    npm install -g ${app}
done