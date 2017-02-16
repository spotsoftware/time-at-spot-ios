source 'https://github.com/CocoaPods/Specs.git'
platform :ios, :deployment_target => "9.0"
use_frameworks!

def shared_pods
    pod 'Kingfisher'
    pod 'Fabric'
    pod 'MyEnvironmentConfig'
    pod 'Charts'
    pod 'OneSignal'
    pod 'IQKeyboardManagerSwift', '~> 4.0'
    pod 'RealmSwift'
    pod 'Alamofire', '~> 4.3'
    pod 'Google/SignIn'
    pod 'KeychainSwift'
    pod 'AlamofireObjectMapper', '~> 4.0'
    pod 'ObjectMapper', '~> 2.2'
    pod 'ObjectMapper+Realm'
end

target 'TimeApp' do
    shared_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
