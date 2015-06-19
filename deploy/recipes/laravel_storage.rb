
node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current"
  execute "sudo chmod -R 775 #{app_root}/storage/" do
  end
end

include_recipe 'deploy::env_create'
include_recipe 'deploy::composer_install'
include_recipe 'deploy::php_set'
