#!/bin/bash
set -eo pipefail
STACK_NAME=$(cat stack-name.txt)
ENDPOINT=$(aws cloudformation describe-stacks --stack-name $(echo $STACK_NAME) --query Stacks[0].Outputs[0].OutputValue --output text)
echo http://$ENDPOINT