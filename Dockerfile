FROM ubuntu:14.04
MAINTAINER Anthony Schneider <anthonyserious@gmail.com>

RUN apt-get update && apt-get install -y git && apt-get install -y g++-4.7 && apt-get install -y python && apt-get install -y make && ln -s /usr/bin/g++-4.7 /usr/bin/g++ && ln -s /usr/bin/gcc-4.7 /usr/bin/cc

ENV NODE_DIR /node

VOLUME /app

RUN git clone https://github.com/joyent/node.git $NODE_DIR \
  && cd $NODE_DIR \
  && git checkout tags/v0.10.28 \
  && ./configure \
  && CXX=g++-4.7 make -j8 \
  && ln -s /$NODE_DIR/tools/gyp $NODE_DIR/deps/v8/build \
  && cd $NODE_DIR/deps/v8 \
  && CXX=g++-4.7 make -j8 native \
  && cd $NODE_DIR \
  && make clean

RUN adduser --disabled-password --gecos '' runner
ADD entrypoint.sh /entrypoint.sh
ADD linux-tick-processor.sh $NODE_DIR/deps/v8/tools/linux-tick-processor.sh

ENTRYPOINT /entrypoint.sh

