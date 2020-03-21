FROM centos:7

# ansibleでsshができるよう
RUN yum check && \
    yum -y install epel-release && \
    yum -y update && \
    yum -y install openssh-server && \
    yum -y install sudo && \
    yum -y install sshpass

# python設定用
RUN yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip

# ロケーション設定(日本語ロケールを設定)
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

# sshの設定変更
# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# sudo設定
RUN sed -i -e 's/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/' /etc/sudoers && \
    sed -i -e 's/%wheel\tALL=(ALL)\tALL/# %wheel\tALL=(ALL)\tALL/' /etc/sudoers  && \
    visudo -c  && \
    echo "root:password" | chpasswd

# start sshd when booting
RUN /bin/systemctl enable sshd
EXPOSE 22

RUN yum -y install zsh
RUN chsh -s /bin/zsh

CMD /sbin/init