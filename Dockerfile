FROM dorowu/ubuntu-desktop-lxde-vnc:focal

USER root

COPY ./src/install/utils.sh $INST_SCRIPTS/
RUN chmod +x $INST_SCRIPTS/utils.sh && $INST_SCRIPTS/utils.sh

COPY ./src/install/ros.sh $INST_SCRIPTS/
RUN chmod +x $INST_SCRIPTS/ros.sh && $INST_SCRIPTS/ros.sh

COPY ./src/install/ur.sh $INST_SCRIPTS/
RUN chmod +x $INST_SCRIPTS/ur.sh && $INST_SCRIPTS/ur.sh
