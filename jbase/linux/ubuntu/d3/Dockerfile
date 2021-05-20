# Use jBASE-5.8-Ubuntu-20.04 as a parent image
FROM zumasys/jbase:5.8-ubuntu-20.04

LABEL maintainer="docker@zumasys.com" 
LABEL vendor="Zumasys, Inc."
LABEL com.zumasys.os="Ubuntu"
LABEL com.zumasys.os.version="20.04"
LABEL com.zumasys.product="jBASE"
LABEL com.zumasys.product.version="5.8"
LABEL com.zumasys.type="release"

# Customize jBASE configuration
COPY entrypoint.sh /tmp
COPY jbase_config.json /opt/jbase/global/config
COPY jagent_config /opt/jbase/global/config

ENTRYPOINT ["/bin/bash", "/tmp/entrypoint.sh"]
