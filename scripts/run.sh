#!/bin/bash

# Initialize first run
if [[ -e /.firstrun ]]; then
    echo "Going to run first_run.sh"
    /scripts/first_run.sh
fi

# Start MongoDB
echo "Starting MongoDB..."
/usr/bin/mongod
