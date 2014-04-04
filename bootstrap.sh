#!/usr/bin/env bash

# update
apt-get update

# upgrade
apt-get upgrade

# install thing
apt-get install -y curl git lynx tmux tree vim

# install rvm
curl -sSL https://get.rvm.io | bash -s stable

# activate rvm
source /usr/local/rvm/scripts/rvm

# add vagrant user to `rvm` group
usermod -a -G rvm vagrant

# install ruby 2.1.1
rvm install ruby-2.1.1

# use ruby 2.1.1 and set it as the default
rvm use ruby-2.1.1 --default

# lets get personal
# all of these commands are run with su as shell provisioning is run as root and
# the permissions b0rk. This is a quick fix and there's probably a better way to
# do it.

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
