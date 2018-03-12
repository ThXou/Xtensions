Pod::Spec.new do |s|
  s.name             = "Xtensions"
  s.version          = "1.1.0"
  s.summary          = "A collection of useful Swift extensions."
  s.homepage         = "https://bitbucket.org/doonamis/xtensions"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Doonamis" => "lcardenas@doonamis.es" }
  s.source           = { :git => "https://bitbucket.org/doonamis/xtensions.git", :tag => s.version }

  s.platform     = :ios, '9.0'
  s.source_files = 'Source/**/*.swift'
  s.requires_arc = true
  s.module_name = 'Xtensions'
end
