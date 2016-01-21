project "consul" do |proj|
  # Project level settings our components will care about
  proj.setting(:prefix, File.join("/opt", "consul"))
  proj.setting(:sysconfdir, File.join(proj.prefix, "etc"))
  proj.setting(:datadir, File.join(proj.prefix, "share"))

  proj.setting(:logdir, File.join(proj.prefix, "var", "log"))
  proj.setting(:bindir, File.join(proj.prefix, "bin"))
  proj.setting(:libdir, File.join(proj.prefix, "lib"))
  proj.setting(:link_bindir, File.join("/usr", "local", "bin"))
  proj.setting(:link_sysconfdir, File.join("/etc" ))
  proj.setting(:link_logdir, File.join("/var", "log"))
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
  proj.component "web_ui"
#  proj.component "tools"

  proj.directory proj.prefix, owner: "consul", group: "consul"
  proj.directory proj.link_bindir, owner: "consul", group: "consul"
#  proj.directory proj.link_sysconfdir
#  proj.directory proj.link_logdir
  #
  proj.user "consul", group:"consul", is_system:true, homedir:"/opt/consul/share", shell:"/bin/bash"
end
