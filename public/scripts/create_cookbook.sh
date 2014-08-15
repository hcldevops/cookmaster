#! /bin/bash
cd $HOME/chef-repo/chef
echo bibinmtech | sudo knife cookbook create $1 -o $2
echo bibinmtech | sudo rm $2/$1/recipes/default.rb
echo bibinmtech | sudo knife cookbook upload $1
