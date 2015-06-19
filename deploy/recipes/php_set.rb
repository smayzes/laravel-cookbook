node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current"
   bash 'run_php_set' do
    user 'root'
    cwd  "#{app_root}"
    code <<-EOH
      sudo service php5-fpm restart
      EOH
    end
  end
