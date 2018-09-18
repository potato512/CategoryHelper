Pod::Spec.new do |s|
  s.name         = "SYCategory"
  s.version      = "1.2.7"
  s.summary      = "SYCategory contant category for Fuondation and UIKit."
  s.homepage     = "https://github.com/potato512/SYCategory"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "herman" => "zhangsy757@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/potato512/SYCategory.git", :tag => s.version.to_s }
  s.source_files = 'SYCategory/*.{h}', 'SYCategory/SYCategoryFoundation/*.{h,m}', 'SYCategory/SYCategoryUIKit/*.{h,m}'
  s.resource     = 'SYCategory/SYResources/*.png'
  s.requires_arc = true
  s.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore', 'AssetsLibrary', 'ImageIO', 'Security'
  s.dependency 'SAMKeychain'
end