node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current"
   bash 'run_composer_install' do
    user 'root'
    cwd  "#{app_root}"
    code <<-EOH
      sudo composer install --no-dev
      EOH
    end
  end
