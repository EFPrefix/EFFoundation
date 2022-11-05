Pod::Spec.new do |s|
  s.name             = 'EFFoundation'
  s.version          = '1.5.1'
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
  
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'
  s.tvos.deployment_target = '11.0'
  s.watchos.deployment_target = '6.0'

  s.subspec 'Core' do |core|
    core.source_files = 'EFFoundation/Core/**/*.{h,swift}'
  end
end
