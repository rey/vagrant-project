#!/usr/bin/env bash

# update
apt-get update

# upgrade
apt-get upgrade

# install thing
apt-get install -y curl git tmux tree vim

# install rvm
curl -sSL https://get.rvm.io | bash -s $1

# activate rvm
source /etc/profile.d/rvm.sh

# add vagrant user to `rvm` group
usermod -a -G rvm vagrant

# install ruby 2.1.1
rvm install ruby-2.1.1

# use ruby 2.1.1 and set it as the default
rvm use ruby-2.1.1 --default

# lets get personal

# get dotfiles
echo "Get dotfiles"
su -c "git clone https://github.com/rey/.dot.git /home/vagrant/.dot" - vagrant

# install dotfiles
su -c "sh /home/vagrant/.dot/install.sh" - vagrant

# get vim config
su -c "git clone https://github.com/rey/.vim.git /home/vagrant/.vim" - vagrant

# install vim config
su -c "sh /home/vagrant/.vim/install.sh" - vagrant

# get tmux config
su -c "git clone https://github.com/rey/.tmux.git /home/vagrant/.tmux" - vagrant

# install tmux config
su -c "sh /home/vagrant/.tmux/install.sh" - vagrant

# finish
echo "Done"
