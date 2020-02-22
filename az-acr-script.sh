#!/bin/bash

res=myresourcegroup
acr=myazcontainerregistry

az group create -g $res -l westus

az acr create -g $res -n $acr --sku Basic or Standard --admin-enabled
az acr build -g $res -r $acr --image demonodejs:v1 .

#In that json result, there is will loginserver. we will need that and also the image built
# get registry user and password
loginserver=loginserver
imgae=myimage
az acr credential show -g $res -n $acr

user=xxxxx
password=yyyy

az container create -g $res --name myazacr --image $image --registry-login-server $loginserver \
        --ip-address Public --dns-name-label mydemodns --ports 'port of nodejs app' --registry-username $user \
        --registry-password $password

#done
