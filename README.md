# docker-linux-tick-processor
Run the Node.js linux-tick-processor from Ubuntu.  This is overall pretty complicated to build, and your linux-tick-processor really needs to be built from the source of the exact same Node.js version you're profiling, and I think that justifies building a big old container just to run it.

The default build here is for Node.js v0.10.28, which is the default on Ubuntu 14.04.  Change the tag in Dockerfile to build for a different version.

Map the directory containing your v8.log as /data, i.e. `docker run anthonyserious/docker-linux-tick-processor:v0.10.28`.

