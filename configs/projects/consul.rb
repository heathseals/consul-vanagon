project "consul" do |proj|
  # Project level settings our components will care about
  proj.setting(:prefix, File.join("/opt", "consul"))
  proj.setting(:sysconfdir, File.join(proj.prefix, "etc"))
  proj.setting(:datadir, File.join(proj.prefix, "share"))

  proj.setting(:logdir, File.join(proj.prefix, "var", "log"))
  proj.setting(:bindir, File.join(proj.prefix, "bin"))
  proj.setting(:link_bindir, File.join("/usr", "local", "bin"))
  proj.setting(:tmpfilesdir, "/usr/lib/tmpfiles.d")

  platform = proj.get_platform

  proj.description "Jumbo package with consul, ui and tools in /opt/consul"
  proj.version_from_git
  proj.write_version_file File.join(proj.prefix, 'VERSION')
  proj.license "See components"
  proj.vendor "Stahnma <stahnma@wesages.com>"
  proj.homepage "https://consul.io"
  proj.target_repo ""

  proj.component "consul"
#  proj.component "ui"
#  proj.component "tools"

  proj.directory proj.prefix
  proj.directory proj.sysconfdir
  proj.directory proj.logdir
  proj.directory proj.link_bindir
end
