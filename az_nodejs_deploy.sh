#!/bin/bash

# Replace the following URL with a public GitHub repo URL
gitrepo=https://github.com/link78/nodejsExpress.git
webname=demofasonodejs
webplan=fasowebplan
Res=fasobfkdemores

# Create a resource group.
az group create --location westus --name $Res

# Create an App Service plan in `FREE` tier.
az appservice plan create --name $webplan -g $Res --sku FREE --is-linux

# Create a web app.
az webapp create --name $webname --resource-group $Res --plan $webplan --runtime "node|10.14"

# Deploy code from a public GitHub repository. 
az webapp deployment source config --name $webname --resource-group $Res \
--repo-url $gitrepo --branch master --manual-integration

# Copy the result of the following command into a browser to see the web app.
echo http://$webname.azurewebsites.net
