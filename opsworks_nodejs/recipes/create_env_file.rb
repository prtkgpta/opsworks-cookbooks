node[:deploy].each do |application, deploy|
  template File.join(deploy[:deploy_to], "shared","app.env") do
    source "app.env.erb"
    mode 0770
    owner deploy[:user]
    group deploy[:group]
    variables({:app => application})
    only_if {File.exists?("#{deploy[:deploy_to]}/shared")}
  end
end
