Pod::Spec.new do |s|
  s.name             = 'EFFoundation'
  s.version          = '0.6.0'
  s.summary          = 'EFFoundation.'

  s.description      = <<-DESC
EFFoundation.
                       DESC

  s.homepage         = 'https://github.com/EFPrefix/EFFoundation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EyreFree' => 'eyrefree@eyrefree.org' }
  s.source           = { :git => 'https://github.com/EFPrefix/EFFoundation.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EyreFree777'

  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'

  s.source_files = 'EFFoundation/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EFFoundation' => ['EFFoundation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  
  s.dependency 'DeviceKit', '>= 2.0.0'
  s.dependency 'ReachabilitySwift', '>= 4.3.1'
  s.dependency 'SwiftyAttributes', '>= 5.1.1'
end
