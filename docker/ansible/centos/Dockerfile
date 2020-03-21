FROM centos:7

# FROM ansible/centos7-ansible
ENV ANSIBLE_HOST_KEY_CHECKING False

# infra settings
RUN yum check && \
    yum install -y epel-release && \
    yum -y update && \
    yum -y install openssh-clients && \
    yum -y install openssh-server && \
    yum -y install sudo && \
    yum -y install sshpass

# python install + ansible
RUN yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip
RUN pip install --upgrade pip && \
  pip install ansible

# sshの設定変更
# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config  && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# sudo install
RUN sed -i -e 's/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/' /etc/sudoers && \
    sed -i -e 's/%wheel\tALL=(ALL)\tALL/# %wheel\tALL=(ALL)\tALL/' /etc/sudoers && \
    visudo -c && \
    echo "root:password" | chpasswd

RUN yum -y install fish


EXPOSE 22
CMD /sbin/init