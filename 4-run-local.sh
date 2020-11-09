#!/bin/bash
set -eo pipefail
STACK_NAME=$(cat stack-name.txt)
export AWS_REGION=$(aws configure get region)
export NOTIFICATION_TOPIC=$(aws cloudformation describe-stack-resource --stack-name $STACK_NAME --logical-resource-id notificationTopic --query 'StackResourceDetail.PhysicalResourceId' --output text)
export GAME_TABLE=$(aws cloudformation describe-stack-resource --stack-name $STACK_NAME --logical-resource-id gameTable --query 'StackResourceDetail.PhysicalResourceId' --output text)
export MOVE_TABLE=$(aws cloudformation describe-stack-resource --stack-name $STACK_NAME --logical-resource-id moveTable --query 'StackResourceDetail.PhysicalResourceId' --output text)
export SESSION_TABLE=$(aws cloudformation describe-stack-resource --stack-name $STACK_NAME --logical-resource-id sessionTable --query 'StackResourceDetail.PhysicalResourceId' --output text)
export STATE_TABLE=$(aws cloudformation describe-stack-resource --stack-name $STACK_NAME --logical-resource-id stateTable --query 'StackResourceDetail.PhysicalResourceId' --output text)
export USER_TABLE=$(aws cloudformation describe-stack-resource --stack-name $STACK_NAME --logical-resource-id userTable --query 'StackResourceDetail.PhysicalResourceId' --output text)

./gradlew bootrun