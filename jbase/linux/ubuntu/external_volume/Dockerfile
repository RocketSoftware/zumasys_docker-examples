# Use jBASE-5.8-Ubuntu-20.04 as a parent image
FROM zumasys/jbase:5.8-ubuntu-20.04

# Customize jBASE configuration
COPY entrypoint.sh /tmp

ENTRYPOINT ["/bin/bash", "/tmp/entrypoint.sh"]
