# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
    # Crypto
    pod 'CryptoSwift'
    
    # Redux
    pod 'ReSwift'
    pod 'ReSwiftRouter'
    pod 'ReRxSwift', '~> 1.0'
    
    # Reactive
    pod 'RxSwift', '~> 4.0'
    pod 'RxCocoa', '~> 4.0'
end

target 'FerqoIOS' do
  use_frameworks!
  
  shared_pods

  target 'FerqoIOSTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest',     '~> 4.0'
  end

  target 'FerqoIOSUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
