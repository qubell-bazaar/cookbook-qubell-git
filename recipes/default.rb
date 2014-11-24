include_recipe 'git'

if ( node['qubell-git']['dir'].start_with?('~') )
  node.set['qubell-git']['dir'] = node['qubell-git']['dir'].gsub('~', ENV['HOME'])
end

directory node['qubell-git']['dir'] do
  action :create
end

git "#{node['qubell-git']['dir']}" do
  repository "#{node['qubell-git']['repo']}"
  reference "#{node['qubell-git']['branch']}"
  action :sync 
end