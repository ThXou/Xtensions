Pod::Spec.new do |s|
  s.name            = "Xtensions"
  s.version       	= "1.2.2"
  s.summary       	= "A collection of useful Swift extensions."
  s.homepage      	= "https://bitbucket.org/doonamis/xtensions"
  s.license       	= { :type => 'MIT', :file => 'LICENSE' }
  s.author        	= { "Doonamis" => "lcardenas@doonamis.es" }
  s.source       	= { :git => "https://bitbucket.org/doonamis/xtensions.git", :tag => s.version }

  s.platform     	= :ios, '9.0'
  s.source_files 	= 'Source/**/*.swift'
  s.requires_arc 	= true
  s.module_name 	= 'Xtensions'

  s.subspec 'Bundle' do |ss|
    ss.source_files = 'Source/Bundle/*.swift'
    ss.requires_arc = true
  end

  s.subspec 'NSObject' do |ss|
    ss.source_files = 'Source/NSObject/*.swift'
    ss.requires_arc = true
  end

  s.subspec 'String' do |ss|
    ss.source_files = 'Source/String/*.swift'
    ss.requires_arc = true
  end

  s.subspec 'UIColor' do |ss|
    ss.source_files = 'Source/UIColor/*.swift'
    ss.requires_arc = true
  end

  s.subspec 'UIDevice' do |ss|
    ss.source_files = 'Source/UIDevice/*.swift'
    ss.requires_arc = true
  end

  s.subspec 'UINavigationController' do |ss|
    ss.source_files = 'Source/UINavigationController/*.swift'
    ss.requires_arc = true
  end

  s.subspec 'UIView' do |ss|
    ss.source_files = 'Source/UIView/*.swift'
    ss.requires_arc = true
  end
end
