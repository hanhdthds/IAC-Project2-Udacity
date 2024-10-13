#!/bin/bash

DEFAULT_REGION=us-east-1
DEFAULT_STACK_NAME=HA-website-networks

ACTION=$1
REGION="${2:-$DEFAULT_REGION}"
STACK_NAME="${3:-$DEFAULT_STACK_NAME}"

case $1 in
    create)
        aws cloudformation create-stack \
        --stack-name $STACK_NAME \
        --template-body file://network.yml \
        --parameters file://network-parameters.json \
        --region $REGION
        ;;

    update)
        aws cloudformation update-stack \
        --stack-name $STACK_NAME \
        --template-body file://network.yml \
        --parameters file://network-parameters.json \
        --region $REGION
        ;;

    delete)
        aws cloudformation delete-stack \
        --stack-name $STACK_NAME\
        --region $REGION
    ;;

    *)
        echo "wrong expression, try again! => expecting {create | update | delete}"
    ;;
esac