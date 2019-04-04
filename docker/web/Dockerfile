FROM centos/systemd

ENV LANG en_US.utf8

# Libraries needed to compile Ruby and Node.js
RUN yum install -y patch libyaml-devel glibc-headers autoconf gcc-c++ glibc-devel patch readline-devel zlib-devel libffi-devel openssl-devel automake libtool bison sqlite-devel

# Install basic tools
RUN yum install -y bash which
RUN chsh -s /usr/bin/bash
SHELL ["bash", "-l", "-c"]

# Install Node.js
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs

# Install RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
# RUN rvm install --default 2.5.5
RUN rvm install --default 2.6.2
RUN gem install bundler -V --no-document

# Create basic rails app
RUN gem install rails -v 5.2.3

RUN mkdir -p /var/www/application && cd /var/www/application && rails new current --skip-active-record
RUN mkdir -p /var/www/application/shared/log
RUN mkdir -p /var/www/application/shared/tmp/pids
RUN mkdir -p /var/www/application/shared/tmp/sockets

# Install socat
RUN yum install -y socat

RUN yum clean all

COPY test-puma.sh /test-puma.sh

COPY routes.rb /var/www/application/current/config/routes.rb
COPY pages_controller.rb /var/www/application/current/app/controllers/pages_controller.rb

CMD ["/lib/systemd/systemd"]
