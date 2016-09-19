FROM nginx:stable

# Basic package
RUN apt-get update
RUN apt-get install -y vim git curl wget sudo zsh

# make volume directory
RUN mkdir -p /var/www/vhosts/webapp

# Setting time zone
# Set default system language pack

# Install SSH
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:carpV7' | chpasswd && \
    useradd -m -d /home/kazuhiro -s /bin/bash -G sudo kazuhiro && \
    echo 'kazuhiro:carpV7' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


#CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
