component 'consul' do |pkg, settings, platform|

  if platform.architecture == "x86_64"
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


  pkg.install do
    [
      "pwd",
      "ls",
      "mkdir -p #{settings[:prefix]}",
      "mkdir -p #{settings[:bindir]}",
      "cp -pr ../consul #{settings[:bindir]}"

    ]
  end

end
