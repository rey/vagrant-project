#!/usr/bin/env bash

# update
apt-get update

# upgrade
apt-get upgrade

# install thing
apt-get install -y curl git tmux tree vim

# install rvm
# curl -sSL https://get.rvm.io | bash -s $1

# activate rvm
# source /etc/profile.d/rvm.sh

# install ruby 2.0.0
# rvm install ruby-2.1.1

# use ruby 2.0.0 and set it as the default
# rvm use ruby-2.1.1 --default

# lets get personal

# get dotfiles
echo "Get dotfiles"
git clone https://github.com/rey/.dot.git /home/vagrant/.dot

# install dotfiles
echo "Install dotfiles"
su -c "sh /home/vagrant/.dot/install.sh" - vagrant

# get vim config
# echo "Get vim config"
# git clone https://github.com/rey/.vim.git /home/vagrant/.vim

# install vim config
# echo "Install vim config"
# su -c "sh /home/vagrant/.vim/install.sh" - vagrant

# get tmux config
echo "Get tmux config"
git clone https://github.com/rey/.tmux.git /home/vagrant/.tmux

# install tmux config
echo "Install tmux config"
su -c "sh /home/vagrant/.tmux/install.sh" - vagrant

# finish
echo "Done"
