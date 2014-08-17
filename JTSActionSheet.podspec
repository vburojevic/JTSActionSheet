Pod::Spec.new do |s|
  s.name         = "JTSActionSheet"
  s.version      = "1.0.1"
  s.summary      = "Replacement for UIActionSheet on iOS, with customizable fonts and colors, and block-based actions."
  s.homepage     = "https://github.com/jaredsinclair/JTSActionSheet"
  s.license      = { :type => 'MIT', :file => 'LICENSE'  }
  s.author       = { "Jared Sinclair" => "https://twitter.com/jaredsinclair" }
  s.source       = { :git => "https://github.com/jaredsinclair/JTSActionSheet.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.frameworks   = 'UIKit'

  s.compiler_flags = "-fmodules"
  
  s.ios.deployment_target = '7.0'
  
  s.source_files = ['Source/*.{h,m}']
  
end
