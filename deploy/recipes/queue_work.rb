node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current"
   bash 'run_queue_work' do
    user 'root'
    cwd  "#{app_root}"
    code <<-EOH
      sudo php artisan queue:listen
      EOH
    end
  end
