## gnome

script "install_gnome" do
  interpreter "bash"
  user "root"
  cwd "/tmp/"
  code <<-EOH
  sudo apt-get -y --no-install-recommends install python-software-properties
  sudo add-apt-repository ppa:gnome3-team/gnome3
  sudo apt-get update
  sudo apt-get -y --no-install-recommends install gnome-shell ubuntu-desktop
  sudo apt-get -y gnome-session-fallback
  EOH
end
