#!/bin/bash
MESSAGE=${1:-"Default Message"}

git add -A
git commit -m "${MESSAGE}"
git push origin master 

