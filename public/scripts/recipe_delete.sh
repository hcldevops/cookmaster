#! /bin/bash
cd $1/recipes/
echo bibinmtech | sudo rm $2.rb
cd $HOME/chef-repo/chef

echo bibinmtech | sudo knife cookbook upload $3 -o $4

