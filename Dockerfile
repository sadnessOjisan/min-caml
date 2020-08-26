FROM i386/centos:6

RUN sed -i 's/$basearch/i386/g' /etc/yum.repos.d/CentOS-*.repo \
    && yum install -y git ocaml \
    && git clone https://github.com/sadnessOjisan/min-caml.git