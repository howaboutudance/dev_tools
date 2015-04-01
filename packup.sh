#!/bin/bash

cat file-config | xargs -n 200 -I % rsync -av % ./
