FROM ubuntu

ENV ANSIBLE_HOST_KEY_CHECKING False

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \
    apt-get install -y openssh-server

EXPOSE 22

# ユーザーを作成
ARG UID=1000
RUN useradd -m -u ${UID} docker

# 作成したユーザーに切り替える
# USER ${UID}

CMD /bin/bash
