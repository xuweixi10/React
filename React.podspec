#
# Be sure to run `pod lib lint React.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'React'
  s.version          = '0.1.0'
  s.summary          = 'A short description of React.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xuweixi10/React'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xuweixi10' => '1719439540@qq.com' }
  s.source           = { :git => 'https://github.com/xuweixi10/React.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

#  s.source_files = 'React/Classes/**/*'
  s.subspec 'Base' do |base|
    base.source_files = 'React/Classes/Base/**/*'
  end
  
  s.subspec 'Views' do |views|
    views.source_files = 'React/Classes/Views/**/*'
  end
  
  s.subspec 'DevSupport' do | devSupport |
#    devSupport.source_files = 'React/Classes/DevSupport/**/*'
     devSupport.subspec 'DevSupport' do |devSupport|
       devSupport.source_files = 'React/Classes/DevSupport/DevSupport/**/*'
     end
     
     devSupport.subspec 'Inspector' do |inspector|
       inspector.source_files = 'React/Classes/DevSupport/Inspector/**/*'
     end
  end
  
  s.subspec 'RCTSRWebSocket' do | rCTSRWebSocket |
    rCTSRWebSocket.source_files = 'React/Classes/RCTSRWebSocket/**/*'
  end
  # s.resource_bundles = {
  #   'React' => ['React/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Yoga'
  s.dependency 'React-jsi'
  s.dependency 'React-jsinspector'
  s.dependency 'React-perflogger'
end
