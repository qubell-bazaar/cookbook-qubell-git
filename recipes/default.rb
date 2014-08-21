include_recipe 'git'

if ( node['qubell-git']['app_root'].start_with?('~') )
  node.set['qubell-git']['app_root'] = node['qubell-git']['app_root'].gsub('~', ENV['HOME'])
end

directory node['qubell-git']['app_root'] do
  action :create
end

git "#{node['qubell-git']['app_root']}" do
  repository "#{node['qubell-git']['repo_url']}"
  reference "#{node['qubell-git']['ref']}"
  action :sync 
end
  

case node["platform_family"]
  when "rhel"
    service "iptables" do
      action :stop
    end
  when "debian"
    service "ufw" do
      action :stop
    end
  end
