Pod::Spec.new do |s|
  s.name         = 'GSLAdditions'
  s.version      = '1.0.0'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/GSLAdditions'
  s.source       = { :git => 'https://github.com/GyazSquare/GSLAdditions.git', :tag => 'v1.0.0' }
  s.summary      = 'Objective-C GSL categories for iOS, OS X, watchOS and tvOS.'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.subspec 'FoundationGSLAdditions' do |sp|
    sp.osx.deployment_target = '10.6'
    sp.tvos.deployment_target = '9.0'
    sp.watchos.deployment_target = '2.0'
    sp.source_files = 'FoundationGSLAdditions/*.{h,m}'
  end

  s.subspec 'UIKitGSLAdditions' do |sp|
    sp.tvos.deployment_target = '9.0'
    sp.source_files = 'UIKitGSLAdditions/*.{h,m}'
  end
end