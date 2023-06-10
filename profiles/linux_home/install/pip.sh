#!/bin/bash

apps=(
  dungeonsheets
)

for app in ${apps[@]}; do
  pip install ${app}
done
