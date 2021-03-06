Pod::Spec.new do |s|
  s.name         = 'GSLAdditions'
  s.version      = '4.0.2'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/GSLAdditions'
  s.source       = { :git => 'https://github.com/GyazSquare/GSLAdditions.git', :tag => '4.0.2' }
  s.summary      = 'Objective-C GSL categories for iOS, macOS, watchOS and tvOS.'
  s.requires_arc = true

  s.ios.deployment_target = '9.0'
  s.macos.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.subspec 'FoundationGSLAdditions' do |sp|
    sp.ios.deployment_target = '9.0'
    sp.macos.deployment_target = '10.9'
    sp.tvos.deployment_target = '9.0'
    sp.watchos.deployment_target = '2.0'
    sp.source_files = 'FoundationGSLAdditions/*.{h,m}'
  end

  s.subspec 'UIKitGSLAdditions' do |sp|
    sp.ios.deployment_target = '9.0'
    sp.tvos.deployment_target = '9.0'
    sp.source_files = 'UIKitGSLAdditions/*.{h,m}'
  end
end
