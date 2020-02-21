#!/bin/bash
# git clone the repo app
# cd repoDirectory
#az login enter your credential
echo "Create Resource group"

res=fasobfkresources
webname=fasonodejs
webplan=fasowebplan

az group create -g $res -l westus

#create appservice plan for your  azure  webapp
az appservice plan create -g $res -n $webplan --sku B1 --is-linux
#create web app with node js runtime
az webapp create -g $res -p $webplan -n $webname --runtime "node|10.14" --deployment-local-git

#create user and  pasword for your deployment
az webapp deployment user set --user-name fasouser --password Lion9090

# Get the deployment url and store in URL
URL=$(az webapp deployment source config-local-git -g $res -n $webname --query url -o tsv)

#add the remote azure to your local git repo
git remote add azure $URL
git  push azure master

echo "get the url"
az webapp list -g $res -o table
