#!/bin/bash

machine='awsdl'

AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
VPC='vpc-4dcc1228'

echo -n "Wait for a spot instance (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
    docker-machine create --driver amazonec2  \
        --amazonec2-region us-west-2 \
        --amazonec2-vpc-id ${VPC:-""} \
        --amazonec2-ami ami-9210bbf2 \
        --amazonec2-instance-type p2.xlarge \
        --amazonec2-access-key ${AWS_ACCESS_KEY_ID} \
        --amazonec2-secret-key ${AWS_SECRET_ACCESS_KEY} \
        --amazonec2-root-size 40 \
        --amazonec2-request-spot-instance \
        --amazonec2-spot-price 0.5 \
        $machine
else
    docker-machine create --driver amazonec2  \
        --amazonec2-region us-west-2 \
        --amazonec2-vpc-id ${VPC:-""} \
        --amazonec2-ami ami-9210bbf2 \
        --amazonec2-instance-type p2.xlarge \
        --amazonec2-access-key ${AWS_ACCESS_KEY_ID} \
        --amazonec2-secret-key ${AWS_SECRET_ACCESS_KEY} \
        --amazonec2-root-size 40 \
        --amazonec2-spot-price 0.5 \
        $machine
fi
export NV_HOST="ssh://ubuntu@$(docker-machine ip $machine):"
