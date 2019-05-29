#!/bin/bash

adduser user
echo pass | passwd --stdin user
usermod -aG wheel user

echo pass | passwd --stdin root