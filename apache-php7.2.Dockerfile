FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
COPY setup.sh /setup.sh
RUN /setup.sh
EXPOSE 80/tcp
EXPOSE 22/tcp
ENTRYPOINT service ssh start && service apache2 start && tail -f /dev/null