ENV["COCOAPODS_DISABLE_DETERMINISTIC_UUIDS"] = "true"
platform :ios, '10.0'
inhibit_all_warnings!

def mainPods
  pod 'lottie-ios'
  pod 'SnapKit', '~> 4.0.0'
  pod 'SDWebImage', '~> 4.0'
  pod 'Moya', '~> 11.0'
  pod 'pop', '~> 1.0'
  pod 'Viperit'
  pod 'OHHTTPStubs/Swift'
end

def mainPodsTests
  pod 'Quick'
  pod 'Nimble'
  pod 'Viperit'
  pod 'OHHTTPStubs/Swift'
  pod 'Moya', '~> 11.0'
end

target 'Moodelizer' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  mainPods

  target 'MoodelizerTests' do
    inherit! :search_paths
    mainPodsTests
  end

  target 'MoodelizerUITests' do
    inherit! :search_paths
    mainPods
  end

end