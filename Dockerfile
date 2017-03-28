FROM dockerhub.hi.inet/dcip/minimal:7
# TODO
# Instalar snippets per server-spec: https://github.com/glidenote/serverspec-snippets


MAINTAINER Jaume

RUN yum -y update && \
    yum -y install git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel && \
    yum -y clean all

#RUN /usr/sbin/useradd -m -s /bin/bash -c "ServerSpec user" servspec
USER contint

WORKDIR /home/contint
RUN git clone git://github.com/sstephenson/rbenv.git .rbenv

RUN git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN ${HOME}/.rbenv/bin/rbenv install -v 2.2.1
RUN ${HOME}/.rbenv/versions/2.2.1/bin/gem install 'serverspec' 
RUN ${HOME}/.rbenv/versions/2.2.1/bin/gem install 'highline' 

RUN echo 'eval "$(${HOME}/.rbenv/bin/rbenv init -)"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/.rbenv/versions/2.2.1/bin:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
#RUN exec $SHELL

USER root

# No fa falta en DCIP
#CMD ["/bin/bash"]
