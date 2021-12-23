#!/bin/sh
set -e

usage=$'create new project usage
ng new [Project Name] --directory .
NOTE: you shulde set "--directory . " create project files in current directory "workspaces" in this conatiner.
'

if [ -f package.json ] ; then
  npm install;
else
  echo $usage
fi
