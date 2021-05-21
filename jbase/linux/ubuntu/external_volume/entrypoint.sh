#!/bin/bash
# Relocate JBCGLOBALDIR & JBCDATADIR to external volume
if [ -d "/mnt/jbase" ]; then
    if [[ -d "/jbasedata" && ! -L "/jbasedata" ]]; then
        if [ ! -d "/mnt/jbase/dbms" ]; then
            mkdir /mnt/jbase/dbms
            chown jbaseadm:jbase /mnt/jbase/dbms
            chmod 775 /mnt/jbase/dbms
            cp -aR /jbasedata/* /mnt/jbase/dbms/
            rm -rf /jbasedata
            ln -s /mnt/jbase/dbms /jbasedata
            echo "NOTICE:startup: JBCDATADIR moved to external volume /mnt/jbase/dbms"
        else
            echo "ERROR:startup: /mnt/jbase/dbms already exists in the external volume!"
        fi
    fi
    if [[ -d "/opt/jbase/global" && ! -L "/opt/jbase/global" ]]; then
        if [ ! -d "/mnt/jbase/global" ]; then
            mkdir /mnt/jbase/global
            chown jbaseadm:jbase /mnt/jbase/global
            chmod 775 /mnt/jbase/global
            cp -aR /opt/jbase/global/* /mnt/jbase/global/
            rm -rf /opt/jbase/global
            ln -s /mnt/jbase/global /opt/jbase/global
            echo "NOTICE:startup: JBCGLOBALDIR moved to external volume /mnt/jbase/global"
        else
            echo "ERROR:startup: /mnt/jbase/global already exists in the external volume!"
        fi
    fi
else
    echo "ERROR:startup: External volume /mnt/jbase is not mounted!"
fi

# after startup tasks, exec systemctl to start services
exec systemctl --init default
