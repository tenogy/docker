FROM centos/systemd

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd sudo; yum clean all
ADD init.sh /init.sh
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
RUN chmod 755 /init.sh
EXPOSE 22
RUN sh init.sh
RUN systemctl enable sshd;
CMD ["/usr/sbin/init"]