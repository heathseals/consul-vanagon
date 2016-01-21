component 'consul' do |pkg, settings, platform|

  if platform.architecture == "x86_64" || platform.architecture == "amd64"
    arch = "amd64"
    pkg.md5sum "a336895f0b2d9c4679524f0c9896e1ec"
  end
  if platform.architecture  =~ /arm/
    arch = "arm"
    pkg.md5sum "e1da69c2169333dc7aea6dcc83a76dfc"
  end
  if platform.architecture == "i386"
    arch = "386"
    pkg.md5sum "fc8961ada5fe66902fb04fc28ab36477"
  end
  os = "linux" if platform.is_linux?
  pkg.version "0.6.3"
  pkg.url "https://releases.hashicorp.com/#{pkg.get_name}/#{pkg.get_version}/#{pkg.get_name}_#{pkg.get_version}_#{os}_#{arch}.zip"

  pkg.add_source "file://files/default.json", sum: "b14953a2b5a07b8fc64d77e8a8b92dc2"
  pkg.add_source "file://files/consul.service", sum: "486d00700ffe5d6db0a14ff4de2e5fe2"

  case platform.servicetype
  when "systemd"
    pkg.install_service "../consul.service"
  end


  pkg.install do
    [
      "mkdir -p #{settings[:prefix]}",
      "mkdir -p #{settings[:bindir]}",
      "mkdir -p #{settings[:sysconfdir]}",
      "mkdir -p #{settings[:libdir]}",
      "cp -pr ../consul #{settings[:bindir]}",
      "cp -pr ../default.json #{settings[:sysconfdir]}"
    ]
  end

  pkg.link "#{settings[:prefix]}/bin/consul", "#{settings[:link_bindir]}/consul"

end
