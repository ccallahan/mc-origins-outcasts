FROM docker.io/redhat/ubi9 AS base

RUN dnf -y update
WORKDIR /app
COPY dl-mods.sh /tmp/dl-mods.sh
COPY mods.txt /tmp/mods.txt
RUN /bin/bash /tmp/dl-mods.sh

FROM docker.io/redhat/ubi9 AS final
RUN dnf -y update && dnf -y install https://download-ib01.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/e/epel-release-9-4.el9.noarch.rpm
RUN /usr/bin/crb enable
RUN dnf -y install neofetch java-17-openjdk
RUN mkdir /minecraft

RUN dnf clean all
COPY --from=base /app/ /app/
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
COPY neo.conf /etc/neo.conf
WORKDIR /minecraft/
CMD ["/app/entrypoint.sh"]