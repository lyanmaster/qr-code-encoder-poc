# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

use_frameworks!

target 'QRCodePOC' do
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for PlaygroundSimulator
  pod "QRCode"
  pod "EFQRCode"
  pod "QRCoder"
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['QRCode', 'QRCoder'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
      else
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '5.0'
      end
    end
  end
end

