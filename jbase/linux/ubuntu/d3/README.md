# Ubuntu 20.04 with jBASE 5.8 configured for D3 compatibility

This image includes jBASE 5.8 installed and running on Ubuntu 20.04. Acceptable use cases include development and production environments.

Images built from this Dockerfile are published to:

[https://hub.docker.com/repository/docker/zumasys/jbase](https://hub.docker.com/repository/docker/zumasys/jbase)

This particular image is published as `zumasys/jbase:5.8-ubuntu-20.04-d3`.

## Steps to build and run

From this directory:

``` text
docker build --rm -t zumasys/jbase:5.8-ubuntu-20.04-d3 .
docker run --name u20_jbase_d3 -h u20_jbase_d3 -p 22:22 -d -it zumasys/jbase:5.8-ubuntu-20.04-d3
docker exec -it u20_jbase_d3 bash
```

## Run a persistant docker

``` shell
# Only once, create persistant storage volume
docker volume create jbasedata

docker run --name jbase_dev -p 22:22 -p 20002:20002 -d -it --mount source=jbasedata,target=/jbasedata zumasys/jbase:5.8-ubuntu-20.04-d3

# You can now ssh localhost
# browser can point to localhost:20002

# the /jbasedata now holds global and dbms.
# dbms = JBCDATADIR - This is where your accounts will go by default
# global = This is where the config and other jBASE items that are unique to your
# install go.
#
# All other directories are tied to the docker.  You can at any time pull a new docker and
# run that docker and attach your /jbasedata directory.
#
# If you do make changes to any linux items outside /jbasedata you need to record them and
# create a script that puts items back.
#
# This model allows you to get any additional pre-build items that we do for a jBASE Dev
# box that are outside the installer
#
```
