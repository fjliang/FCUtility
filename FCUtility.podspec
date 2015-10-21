Pod::Spec.new do |s|
  s.name         = "FCUtility"
  s.version      = "0.0.1"
  s.summary      = "IOS Object-C 通用库"
  s.homepage     = "hhttps://github.com/fjliang/FCUtility"
  s.license      = "MIT"
  s.authors      = { "FJL" => "470987684@qq.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/fjliang/FCUtility.git", :tag => s.version }
  #s.source_files = "**/*"

  s.source_files = "FCUtility/Extension"
  #s.resource     = "FCUtility/FCUtility.bundle"
  s.requires_arc = true
end

