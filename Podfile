# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Solar Warning' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Solar Warning
  pod 'Alamofire', '~> 5.4'
  pod 'AlamofireNetworkActivityLogger', '~> 3.4'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "13.0"
      end
    end
  end

end
