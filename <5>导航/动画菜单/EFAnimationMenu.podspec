Pod::Spec.new do |s|
  s.name         = 'EFAnimationMenu'
  s.version      = '0.0.8'
  s.license      = 'MIT'
  s.platform     = :ios, '7.0'
  s.summary      = 'This is a rotating menu, it is very convenient to use.'
  s.homepage     = 'https://github.com/jueXying/EFAnimationMenu'
  s.author       = { 'jueyingxx' => '327592992@qq.com' }
  s.source       = { :git => 'https://github.com/jueXying/EFAnimationMenu.git', :tag => s.version.to_s }
  s.source_files  = 'EFAnimationMenu/EFAnimationViewController.{h,m}'
  s.requires_arc = true

end
