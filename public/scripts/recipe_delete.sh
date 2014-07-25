#! /bin/bash
cd $1/recipes/
echo Admin098 | sudo rm $2.rb
cd $HOME/chef-repo/chef

echo Admin098 | sudo knife cookbook upload $3 -o $4

