FROM centos:latest

ADD http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo /etc/yum.repos.d/

RUN yum -y install $(yum -y list | grep VirtualBox | sort | tail -1 | cut -f 1 -d " ")

RUN VERSION=$(VBoxManage --version | tail -1 | cut -f 1 -d "r") && \
    curl -Lo /Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack http://download.virtualbox.org/virtualbox/${VERSION}/Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack && \
    yes | VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack && \
    rm -rf Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack

RUN yum -y install make epel-release initscripts && yum -y install dkms

RUN yum clean all

WORKDIR /lib/virtualbox

ENTRYPOINT ["./vboxdrv.sh"]

CMD ["setup"]
