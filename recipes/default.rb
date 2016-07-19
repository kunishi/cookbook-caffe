#
# Cookbook Name:: cookbook-caffe
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "build-essential"
include_recipe "git"
include_recipe "poise-python"

software_dir = node['caffe']['software_dir']
local_user = node['caffe']['local_user']
local_group = node['caffe']['local_group']

directory software_dir do
  owner local_user
  group local_group
end

package 'build-essential'
package 'git'
package 'libprotobuf-dev'
package 'libleveldb-dev'
package 'libsnappy-dev'
package 'libopencv-dev'
package 'libhdf5-serial-dev'
package 'protobuf-compiler'
package 'libboost-all-dev'
package 'libatlas-base-dev'
package 'libgflags-dev'
package 'libgoogle-glog-dev'
package 'liblmdb-dev'

python_runtime 'caffe' do
  version '3.4'
  provider :system
  options :system, dev_package: true
end
python_package 'numpy'

git "#{software_dir}/caffe" do
  repository "https://github.com/BVLC/caffe.git"
  action :sync
  user local_user
  group local_group
end

#template "#{software_dir}/caffe/Makefile.config" do
#  source "Makefile.config.erb"
#  mode 0644
#  owner local_user
#  group local_group
#end
