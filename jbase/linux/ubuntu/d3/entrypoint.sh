#!/bin/bash
# perform any startup tasks
# startup tasks that only run once
if [ ! -f "run_once" ]; then
    date > run_once
    # make SYSTEM & JBASEADM case-insensitive
    /opt/jbase/CurrentVersion/bin/jrf -K -U -V /jbasedata/SYSTEM]D
    /opt/jbase/CurrentVersion/bin/jrf -K -U -V /jbasedata/JBASEADM/MD]D
    # create the PIBS file
    /opt/jbase/CurrentVersion/bin/CREATE-FILE /jbasedata/JBASEADM/PIBS TYPE=PROC
    # enable optional services
    systemctl enable jAgent.service
    systemctl enable jRFS.service
    systemctl daemon-reload
fi
# after startup tasks, exec systemctl to start services
exec systemctl --init default
