project "pl-consul" do |proj|
  # Project level settings our components will care about
  proj.setting(:install_root, "/opt/consul")
  proj.setting(:prefix, File.join(proj.install_root, "puppet"))

  if platform.is_eos?
    proj.setting(:sysconfdir, "/persist/sys/etc/consul")
    proj.setting(:link_sysconfdir, "/etc/consul")
  elsif platform.is_osx?
    proj.setting(:sysconfdir, "/private/etc/consul")
  elsif platform.is_eos?
    proj.setting(:sysconfdir, "/persist/sys/etc/consul")
    proj.setting(:link_sysconfdir, "/etc/consul")
  else
    proj.setting(:sysconfdir, "/etc/consul")
  end

  proj.setting(:puppet_configdir, File.join(proj.sysconfdir, 'puppet'))
  proj.setting(:puppet_codedir, File.join(proj.sysconfdir, 'code'))
  proj.setting(:logdir, "/var/log/consul")
  proj.setting(:piddir, "/var/run/consul")
  proj.setting(:bindir, File.join(proj.prefix, "bin"))
  proj.setting(:link_bindir, "/opt/consul/bin")
  proj.setting(:libdir, File.join(proj.prefix, "lib"))
  proj.setting(:includedir, File.join(proj.prefix, "include"))
  proj.setting(:datadir, File.join(proj.prefix, "share"))
  proj.setting(:mandir, File.join(proj.datadir, "man"))
  proj.setting(:gem_home, File.join(proj.libdir, "ruby/gems/2.1.0"))
  proj.setting(:tmpfilesdir, "/usr/lib/tmpfiles.d")
  proj.setting(:ruby_vendordir, File.join(proj.libdir, "ruby", "vendor_ruby"))
  proj.setting(:host_ruby, File.join(proj.bindir, "ruby"))
  proj.setting(:host_gem, File.join(proj.bindir, "gem"))

  platform = proj.get_platform


  proj.setting(:gem_install, "#{proj.host_gem} install --no-rdoc --no-ri --local ")


  proj.description "The Puppet Agent package contains all of the elements needed to run puppet, including ruby, facter, hiera and mcollective."
  proj.version_from_git
  proj.write_version_file File.join(proj.prefix, 'VERSION')
  proj.license "See components"
  proj.vendor "Puppet Labs <info@consul.com>"
  proj.homepage "https://www.consul.com"
  proj.target_repo ""


  # For some platforms the default doc location for the BOM does not exist or is incorrect - move it to specified directory
  if platform.name =~ /cisco-wrlinux/
    proj.bill_of_materials File.join(proj.datadir, "doc")
  end

  # Platform specific
  proj.setting(:cflags, "-I#{proj.includedir} -I/opt/pl-build-tools/include")
  proj.setting(:ldflags, "-L#{proj.libdir} -L/opt/pl-build-tools/lib -Wl,-rpath=#{proj.libdir}")

  # First our stuff
  proj.component "consul"





  proj.directory proj.install_root
  proj.directory proj.prefix
  proj.directory proj.sysconfdir
  proj.directory proj.logdir
  proj.directory proj.piddir
  proj.directory proj.link_bindir

end
