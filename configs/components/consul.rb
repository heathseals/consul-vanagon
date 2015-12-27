component 'consul' do |pkg, settings, platform|
  pkg.load_from_json("configs/components/consul.json")

  pkg.build_requires "epel-release"
  pkg.build_requires "golang"
  pkg.environment "GOPATH" => "/tmp/golibs"


  pkg.build do
    ["cd /tmp/golibs/src/github.com/hashicorp/consul",
    "#{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1)"
    ]
  end

  pkg.install do
   [ "ls" ] 
  end
end
