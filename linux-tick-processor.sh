#!/bin/bash

NODE_DIR=/node
cd /data
export PATH=$NODE_DIR/deps/v8/out/native:$PATH 
$NODE_DIR/deps/v8/tools/linux-tick-processor "$@"




