#!/bin/bash

ssh-keygen -t ed25519 -b 4096 -f main-key -q -N ""
ssh-add ./ssh/main-key
