#!/bin/bash
# [wf] any setup required by the pipeline.
# Things like installing packages, allocating resources
# or deploying software on remote infrastructure can be implemented here.
set -e

# Create simulations folder if it doesn't exist for simulations.
mkdir -p simulations/

# Create scripts folder if it doesn't exist for python scripts.
mkdir -p scripts/

# Create scripts folder if it doesn't exist for output log.
mkdir -p output/

# Import and install modules such as Python, Pip, Jijna, Java-Random.

# Install modules in docker container

docker/Dockerfile

docker build -t cooja-exp docker/

docker run -v `pwd`:/experiment --workdir=/experiment cooja-exp ./myexp.py

# Create simulation files
scripts/create_sim_files.py

exit 0
