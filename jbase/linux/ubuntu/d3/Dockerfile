# Use jBASE-5.8-Ubuntu-20.04 as a parent image
FROM zumasys/jbase:5.8-ubuntu-20.04

# Customize jBASE configuration
COPY jbase_config.json /opt/jbase/global/config
COPY jagent_config /opt/jbase/global/config

COPY jbase_d3_setup /tmp
RUN /opt/jbase/CurrentVersion/bin/jsh -a JBASEADM -c "PARA /tmp jbase_d3_setup"

# Enable jagent & jrfs services
RUN systemctl enable jAgent.service
RUN systemctl enable jRFS.service

# Inherit entrypoint.sh from base image to start services
