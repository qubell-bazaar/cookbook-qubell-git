require 'minitest/spec'

describe_recipe 'qubell-git::default' do
  it "creates solr_src folder" do
    assert File.directory?("#{node['qubell-git']['dir']}")
  end
end

