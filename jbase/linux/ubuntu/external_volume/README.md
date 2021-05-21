# Ubuntu 20.04 with jBASE 5.8 using external volume for jBASE configuration and data

This example will output jBASE 5.8 installed and running on Ubuntu 20.04. Before `docker run`, create an external volume, and in the `docker run` command, mount the external volume. The startup script will move the jBASE global and data directories to the external volume and create symbolic links from the original locations. Acceptable use cases include development and production environments.

## Steps to build and run

From this directory:

``` text
docker build --rm -t jbase-5.8-ubuntu-20.04-ext .
docker volume create jbasedata
docker run --name u20_jbase_ext -h u20_jbase_ext -p 22:22 -d -it -v jbasedata:/mnt/jbase jbase-5.8-ubuntu-20.04-ext
docker logs u20_jbase_ext
docker exec -it u20_jbase_ext bash
```
