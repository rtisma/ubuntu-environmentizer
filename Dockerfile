FROM ubuntu:latest

WORKDIR /user-dir
ARG INIT_SCRIPT_FILE=./scripts/build_init.sh

RUN apt update && \
        apt install -y software-properties-common python python-pip && \
        pip install ansible

COPY $INIT_SCRIPT_FILE /build_init.sh
RUN chmod +x /build_init.sh && /build_init.sh

COPY ./scripts/run_command.sh /run_command.sh
RUN chmod +x /run_command.sh && cat /run_command.sh

ENTRYPOINT ["/run_command.sh"]
CMD ["ls","-la"]

