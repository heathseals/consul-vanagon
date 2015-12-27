project "puppet-agent" do |proj|
  # Project level settings our components will care about
  proj.setting(:prefix, "/opt/consul")
  proj.setting(:datadir, File.join(proj.prefix, "share"))
  proj.setting(:sysconfdir, File.join(proj.prefix, "etc/consul"))
  proj.setting(:logdir, File.join(proj.prefix, "var/log"))
  proj.setting(:bindir, File.join(proj.prefix, "bin"))
  proj.setting(:link_bindir, "/usr/local/bin")
  platform = proj.get_platform


  proj.description "Consul contained in /opt/consul"
  proj.version_from_git
  proj.write_version_file File.join(proj.prefix, 'VERSION')
  proj.license "See components"
  proj.homepage "https://consul.io"

  proj.component "consul"

  proj.directory proj.prefix
#  proj.directory proj.link_bindir

end
