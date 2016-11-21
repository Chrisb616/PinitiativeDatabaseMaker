platform :ios, '10.1'
use_frameworks!

target 'LemonHandshakeDatabase' do

pod 'Firebase/Core'
pod 'Firebase/Database'
pod 'Firebase/Auth'
pod 'GeoFire', :git => 'https://github.com/firebase/geofire-objc.git'

end


post_install do |installer|
   installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
           config.build_settings['SWIFT_VERSION'] = '3.0'
       end
   end
end