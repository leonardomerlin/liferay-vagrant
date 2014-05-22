## auto-login

script "startup-setup" do
  interpreter "bash"
  user "root"
  cwd "/home/vagrant"
  code <<-EOH
  echo "autologin-user=vagrant" >> /etc/lightdm/lightdm.conf
  echo "autologin-user-timeout=0" >> /etc/lightdm/lightdm.conf
  passwd -d vagrant
  mkdir -p /home/vagrant/Desktop
  EOH
end

