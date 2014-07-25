#! /bin/bash
cd $HOME/chef-repo/chef
echo Admin098 | sudo knife cookbook create $1 -o $2
echo Admin098 | sudo rm $2/$1/recipes/default.rb
echo Admin098 | sudo knife cookbook upload $1
