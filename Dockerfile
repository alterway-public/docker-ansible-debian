# Debian Wheezy
FROM debian:wheezy
MAINTAINER Hel <herve.leclerc@alterway.fr>
RUN apt-get -y update && \
    apt-get install -y sudo procps psmisc python-yaml python-jinja2 python-httplib2 && \
    apt-get install -y python-keyczar python-paramiko python-setuptools python-pkg-resources && \
    apt-get install -y git python-pip
RUN mkdir /etc/ansible/
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN mkdir /opt/ansible/
RUN git clone http://github.com/ansible/ansible.git /opt/ansible/ansible
WORKDIR /opt/ansible/ansible
RUN git submodule update --init
ENV PATH /opt/ansible/ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /opt/ansible/ansible/lib
ENV ANSIBLE_LIBRARY /opt/ansible/ansible/library
