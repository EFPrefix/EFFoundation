Pod::Spec.new do |s|
  s.name             = 'EFFoundation'
  s.version          = '1.3.0'
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
  s.default_subspec = 'Core'
  s.frameworks = 'Foundation'
  
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'

  s.subspec 'Core' do |core|
    core.source_files = 'EFFoundation/Core/**/*.{h,swift}'
  end
  
  s.subspec 'Attributes' do |attributes|
    attributes.ios.deployment_target = '8.0'
    attributes.tvos.deployment_target = '9.0'
    attributes.osx.deployment_target = '10.11'
    attributes.watchos.deployment_target = '2.0'
    
    attributes.source_files = 'EFFoundation/Attributes/*.{h,swift}'
    attributes.dependency 'EFFoundation/Core'
    attributes.dependency 'SwiftyAttributes', '~> 5.1.1'
  end
  
  s.subspec 'Device' do |device|
    device.ios.deployment_target = '8.0'
    
    device.source_files = 'EFFoundation/Device/*.{h,swift}'
    device.dependency 'EFFoundation/Core'
    device.dependency 'DeviceKit', '~> 2.3.0'
  end
  
  s.subspec 'Reachability' do |reachability|
    reachability.ios.deployment_target = '8.0'
    
    reachability.source_files = 'EFFoundation/Reachability/*.{h,swift}'
    reachability.dependency 'EFFoundation/Core'
    reachability.dependency 'ReachabilitySwift', '~> 5.0.0'
  end
  
  s.subspec 'Complete' do |complete|
    complete.ios.deployment_target = '8.0'

    complete.dependency 'EFFoundation/Core'
    complete.dependency 'EFFoundation/Attributes'
    complete.dependency 'EFFoundation/Device'
    complete.dependency 'EFFoundation/Reachability'
  end
end
