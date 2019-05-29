#!/bin/bash

adduser maple
echo pass | passwd --stdin maple
usermod -aG wheel maple