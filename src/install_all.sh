#!/bin/bash

# Exit inmediately if any command fails
set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

# Install some dependencies
echo 'Enter your sudo password...'
sudo apt update
sudo apt install git curl nano wget -y

${SCRIPT_DIR}/mynvim.sh
${SCRIPT_DIR}/ohmyzshplusplugins.sh
