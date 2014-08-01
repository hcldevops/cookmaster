#! /bin/bash
cd $HOME/chef-repo/chef
echo Admin098 | sudo knife cookbook delete $1 -y