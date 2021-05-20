# Ubuntu 20.04 with jBASE 5.8 configured for D3 compatibility

This example will output jBASE 5.8 installed and running on Ubuntu 20.04 pre-configured specifically to emulate D3. Acceptable use cases include development and production environments.

## Steps to build and run

From this directory:

``` text
docker build --rm -t jbase-5.8-ubuntu-20.04-d3 .
docker run --name u20_jbase_d3 -h u20_jbase_d3 -p 22:22 -d -it jbase-5.8-ubuntu-20.04-d3
docker exec -it u20_jbase_d3 bash
```
