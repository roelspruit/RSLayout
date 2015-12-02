Pod::Spec.new do |s|
  s.name = 'RSLayout'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = 'A collection of helper functions to layout elements in Swift'
  s.homepage = 'https://github.com/roelspruit/RSLayout'
  s.authors = { 'Roel Spruit' => 'roel@roelspruit.com' }
  s.source = { :git => 'https://github.com/roelspruit/RSLayout.git', :tag => s.version }

  s.ios.deployment_target = '9.1'

  s.source_files = 'Source/*.swift'

  s.requires_arc = true
end