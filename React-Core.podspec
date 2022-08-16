#
# Be sure to run `pod lib lint React.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2021.06.28.00-v2'
boost_compiler_flags = '-Wno-documentation'

header_subspecs = {
  'CoreModulesHeaders'          => 'React/Classes/Headers/CoreModules/**/*.h',
  'RCTActionSheetHeaders'       => 'React/Classes/Headers/ActionSheetIOS/*.h',
  'RCTAnimationHeaders'         => 'React/Classes/Headers/NativeAnimation/{Drivers/*,Nodes/*,*}.{h}',
  'RCTBlobHeaders'              => 'React/Classes/Headers/Blob/{RCTBlobManager,RCTFileReaderModule}.h',
  'RCTImageHeaders'             => 'React/Classes/Headers/Image/*.h',
  'RCTLinkingHeaders'           => 'React/Classes/Headers/LinkingIOS/*.h',
  'RCTNetworkHeaders'           => 'React/Classes/Headers/Network/*.h',
  'RCTPushNotificationHeaders'  => 'React/Classes/Headers/PushNotificationIOS/*.h',
  'RCTSettingsHeaders'          => 'React/Classes/Headers/Settings/*.h',
  'RCTTextHeaders'              => 'React/Classes/Headers/Text/**/*.h',
  'RCTVibrationHeaders'         => 'React/Classes/Headers/Vibration/*.h',
}
version = '0.69.4'
Pod::Spec.new do |s|
  s.name             = 'React-Core'
  s.version          = '0.69.4'
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
  s.platforms              = { :ios => "12.4" }
  s.framework              = "JavaScriptCore"
  s.compiler_flags         = folly_compiler_flags + '  ' + boost_compiler_flags
  s.framework              = "JavaScriptCore"
  s.header_dir             = "React"
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/boost\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/RCT-Folly\" \"${PODS_ROOT}/Headers/Public/React-hermes\" \"${PODS_ROOT}/Headers/Public/hermes-engine\" \"${PODS_ROOT}/Headers/Public/FlipperKit\" \"$(PODS_ROOT)/Headers/Public/ReactCommon\" \"$(PODS_ROOT)/Headers/Public/React-RCTFabric\"", "DEFINES_MODULE" => "YES" }
  s.user_target_xcconfig   = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/Headers/Private/React-Core\""}
  
  s.default_subspec        = "Default"

  s.subspec "Default" do |ss|
    ss.source_files           = "React/Classes/Core/**/*.{c,h,m,mm,S,cpp}"
    ss.exclude_files          = "React/Classes/CoreModules/**/*"
#                                "React/Classes/Core/DevSupport/**/*"
#                                "React/Classes/Fabric/**/*",
#                                "React/Classes/FBReactNativeSpec/**/*",
#                                "React/Classes/Tests/**/*",
#                                "React/Classes/Inspector/**/*"
    ss.private_header_files   = "React/Classes/Core/Cxx*/*.h"
  end
  
  s.subspec "DevSupport" do |ss|
    ss.source_files = "React/Classes/Core/DevSupport/DevSupport/*.{h,mm,m}",
                      "React/Classes/Core/DevSupport/Inspector/*.{h,mm,m}"

    ss.dependency "React-Core/Default", version
    ss.dependency "React-Core/RCTWebSocket", version
    ss.dependency "React-jsinspector", version
  end
  

  
  s.subspec "RCTWebSocket" do |ss|
    ss.source_files = "React/Classes/WebSocket/*.{h,m}"
    ss.dependency "React-Core/Default", version
  end
  
  header_subspecs.each do |name, headers|
    s.subspec name do |ss|
      ss.source_files = headers
      ss.dependency "React-Core/Default"
    end
  end
  
  s.dependency 'RCT-Folly' , folly_version
  s.dependency "React-cxxreact"
  s.dependency "React-perflogger"
  s.dependency "React-jsi"
  s.dependency "React-jsiexecutor"
  s.dependency "React-jsinspector", version
  s.dependency "Yoga"
  s.dependency "glog"
end
