FROM ubuntu:19.04
LABEL maintainer="nicolas.landier@gmail.com"

RUN apt update && \
    apt install -y \
    ansible \
    python3-apt \
    git \
    sudo

RUN useradd -ms /bin/bash jdoe
RUN adduser jdoe sudo
RUN echo "jdoe ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# RUN mkdir /playbooks
# WORKDIR /playbooks

USER jdoe
# ADD . /playbooks


# CMD ["/bin/bash"]
CMD [ "ansible-playbook", "local-desktop.yml", "-i", "inventory.ini", "--skip-tags", "ignore" ]
