Pod::Spec.new do |s|
    s.name             = 'EFFoundation'
    s.version          = '0.8.2'
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
    s.frameworks = 'UIKit', 'Foundation'
    s.ios.deployment_target = '8.0'

    s.subspec 'Core' do |core|
        core.source_files = 'EFFoundation/Core/**/*'
    end
    
    s.subspec 'Attributes' do |attributes|
        attributes.source_files = 'EFFoundation/Attributes/**/*'
        attributes.dependency 'EFFoundation/Core'
        attributes.dependency 'SwiftyAttributes', '>= 5.1.1'
    end
    
    s.subspec 'Device' do |device|
        device.source_files = 'EFFoundation/Device/**/*'
        device.dependency 'EFFoundation/Core'
        device.dependency 'DeviceKit', '>= 2.1.0'
    end
    
    s.subspec 'Reachability' do |reachability|
        reachability.source_files = 'EFFoundation/Reachability/**/*'
        reachability.dependency 'EFFoundation/Core'
        reachability.dependency 'ReachabilitySwift', '>= 4.3.1'
    end
    
    s.subspec 'Complete' do |complete|
        complete.dependency 'EFFoundation/Core'
        complete.dependency 'EFFoundation/Attributes'
        complete.dependency 'EFFoundation/Device'
        complete.dependency 'EFFoundation/Reachability'
    end
end
