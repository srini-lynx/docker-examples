FROM ubuntu:14.04
MAINTAINER srini <sridotlynx@gmail>
RUN apt-get update 
RUN apt-get instally -y openssh-server
RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
RUN chmod a-w /etc/ssh/sshd_config 
RUN mkdir /var/run/sshd
RUN echo 'root:AmendingS' | chpasswd 
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
CMD ["/usr/sbin/sshd","-D"]
EXPOSE 22
