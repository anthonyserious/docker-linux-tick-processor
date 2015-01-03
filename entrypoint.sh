#!/bin/bash

NODE_DIR=/node
cd /data
su runner -c $NODE_DIR/deps/v8/tools/linux-tick-processor.sh "$@"


