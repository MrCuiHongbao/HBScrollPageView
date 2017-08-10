Pod::Spec.new do |s|
  s.name         = 'HBScrollPageView'
  s.summary      = 'HBScrollPageView with  pageViewController.'
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'MrCuihongbao' => '675282505@qq.com' }
  s.social_media_url = 'https://mrcuihongbao.github.io'
  s.homepage     = 'https://github.com/MrCuiHongbao/HBScrollPageView'
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source       = { :git => 'https://github.com/MrCuiHongbao/HBScrollPageView.git', :tag => s.version }
  
  s.requires_arc = true
  s.source_files = 'HBScrollPageView/**/*.{h,m}'
  s.public_header_files = 'HBScrollPageView/**/*.{h}'
  
  s.frameworks = 'UIKit'
end
