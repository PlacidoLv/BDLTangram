Pod::Spec.new do |s|
  s.name         = "BDLTangram"
  s.version      = "1.0.0"
  s.summary      = "Tangram is a UI Framework for building a fast and dynamic ScrollView."
  
  s.description  = <<-DESC
                   Tangram is a UI Framework for building a fast and dynamic ScrollView, with two platform support(Android & iOS)
                   DESC

  s.homepage     = "https://github.com/PlacidoLv/BDLTangram"
  s.license      = {
    :type => 'MIT'
  }
  s.author       = { "PlacidoLv" => "723691619@qq.com" }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/PlacidoLv/BDLTangram.git", :tag => s.version, :commit => "fbee737d1fa2866171ca3128bdf02158c9b677ad" }
  s.resources    = 'Tangram/Resource/*.{plist,json}'
  s.source_files = 'Tangram/**/**/*.{h,m}'
  
  s.dependency  'LazyScroll', '~>0.0.2'
  s.dependency  'SDWebImage', '~>3.7'
  
end
