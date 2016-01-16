component 'web_ui' do |pkg, settings, platform|

  pkg.version "0.6.0"
  pkg.url "https://releases.hashicorp.com/consul/#{pkg.get_version}/consul_#{pkg.get_version}_#{pkg.get_name}.zip"
  pkg.md5sum "203dbf20caa91bbbc6554629b8550aeb"

  pkg.install do
    [
      "mkdir -p #{settings[:prefix]}/share/ui",
      "cp -pr ../index* #{settings[:prefix]}/share/ui",
      "cp -pr ../static #{settings[:prefix]}/share/ui"
    ]
  end

end
