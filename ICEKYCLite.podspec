Pod::Spec.new do |s|
  s.name     = 'ICEKYCLite'
  s.version  = '1.0.14'
  s.summary  = 'VNPT eKYC vendor frameworks (ICSdkEKYC, eKYCLite) for native iOS hosts.'
  s.homepage = 'https://github.com/MobileTeamIC/flutter_plugin_ic_ekyc_lite'
  s.license  = { :type => 'Proprietary' }
  s.author   = { 'MobileTeamIC' => 'https://ekyc.vnpt.vn' }
  s.platform = :ios, '12.0'
  s.swift_version = '5.0'
  s.source   = {
    :git => 'https://github.com/MobileTeamIC/flutter_plugin_ic_ekyc_lite.git',
    :tag => "v#{s.version}",
  }
  s.vendored_frameworks = 'ios/SDK/ICSdkEKYC.xcframework',
                          'ios/SDK/eKYCLite.xcframework'
end
