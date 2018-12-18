# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
    # Crypto
    pod 'CryptoSwift'
    
    # Reactive
    pod 'RxSwift', '~> 4.0'
    pod 'RxCocoa', '~> 4.0'
    
    pod 'SnapKit', '~> 4.2.0'
    
    # SDK
    pod 'Firebase/Core'
    pod 'Firebase/Messaging'
end

target 'FerqoIOS' do
  use_frameworks!
  
  shared_pods

  target 'FerqoIOSTests' do
    inherit! :search_paths
    
  end

  target 'FerqoIOSUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
