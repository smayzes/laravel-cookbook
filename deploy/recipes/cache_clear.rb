node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current"
   bash 'run_migrate' do
    user 'root'
    cwd  "#{app_root}"
    code <<-EOH
      sudo php artisan cache:clear
      EOH
    end
  end
