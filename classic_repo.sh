#!/bin/bash

clear

USERNAME="" 
TOKEN="" 

printf "What is the name of your repositery : "

printf "What description do you wanna put on your repositery : "

curl -u $USERNAME:$TOKEN https://api.github.com/user/repos -d '{"name":"'"$REPO_NAME"'","description":"'"$DESCRIPTION"'","private":true}'

printf "What is the absolute path to your local project directory : "

cd "$PROJECT_PATH"

git init
printf "# README.md" > README.md
git add README.md
git commit -m 'Add README.md'
git branch -M master
git remote add origin https://$USERNAME:$TOKEN@github.com/$USERNAME/$REPO_NAME.git
git push -u origin master --force
