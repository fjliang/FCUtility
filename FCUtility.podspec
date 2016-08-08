Pod::Spec.new do |s|
  s.name         = "FCUtility"
  s.version      = "0.0.1"
  s.summary      = "IOS Object-C 通用库"
  s.homepage     = "hhttps://github.com/fjliang/FCUtility"
  s.license      = "MIT"
  s.authors      = { "FJL" => "470987684@qq.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/fjliang/FCUtility.git", :tag => s.version , :submodules => true}
 
  s.subspec 'Extension' do |ss|
    ss.public_header_files = 'FCUtility/Extension/*.h'
    ss.source_files = 'FCUtility/Extension'
  end
 
  s.subspec 'General' do |ss|
    ss.public_header_files = 'FCUtility/General/*.h'
    ss.source_files = 'FCUtility/General'
  end

  #s.source_files = "FCUtility/{Extension,General}"
  #s.resource     = "FCUtility/FCUtility.bundle"
  s.requires_arc = true
end

