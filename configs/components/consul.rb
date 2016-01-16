component 'consul' do |pkg, settings, platform|

  if platform.architecture == "x86_64" || platform.architecture == "amd64"
    arch = "amd64"
    pkg.md5sum "b82b8086b61fc9cddf398a45400fa781"
  end
  if platform.architecture  =~ /arm/
    arch = "arm"
    pkg.md5sum "bba534fe1758fd3679f64ea6bab748c9"
  end
  if platform.architecture == "i386"
    arch = "386"
    pkg.md5sum "0afdbda7636bf085b4794539bcd45f2c"
  end
  os = "linux" if platform.is_linux?
  pkg.version "0.6.0"
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
      "cp -pr ../consul #{settings[:bindir]}",
      "cp -pr ../default.json #{settings[:sysconfdir]}"
    ]
  end

  pkg.link "#{settings[:prefix]}/bin/consul", "#{settings[:link_bindir]}/consul"

end
