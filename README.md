To get started from this repo
===============================
git clone git@github.com:rileycrane/chef-riley.git

vagrant up


To get started from scratch
===============================
mkdir website
cd website

curl https://gist.github.com/rileycrane/5326580/raw/294046048b77bfd610685307de31df2199ac4935/Gemfile > Gemfile
bundle

curl https://gist.github.com/rileycrane/5326587/raw/002a6cc89cbf20346f9b72e3238a78cb3cfadece/knife.rb > knife.rb
knife solo init .

curl https://gist.github.com/rileycrane/5340370/raw/84e012a3e671e3d4c7088c0a42a869800e22a7b0/Cheffile > Cheffile
librarian-chef install

curl https://gist.github.com/rileycrane/5340376/raw/97a3e81a7d3215ec10de6d596f11948ef87b461f/Vagrantfile > Vagrantfile

vagrant up

