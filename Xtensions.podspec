Pod::Spec.new do |s|

  s.name            = "Xtensions"
  s.version       	= File.read('VERSION')
  s.summary       	= "A collection of useful Swift extensions."

  s.description      = <<-DESC
Xtensions is a collection of usefull Swift extensions to make it easy to perform some very common tasks the developer faces in a daily basis as: email validation, UINavigationController transitions, UIColor creation and more. Almost all the Xtensions functions are precided by the "x_" prefix.
                       DESC

  s.homepage      	= "https://github.com/ThXou/Xtensions"
  s.license       	= { :type => 'MIT', :file => 'LICENSE' }
  s.author        	= { 'thxou' => 'yo@thxou.com' }
  s.source       	= { :git => "https://github.com/ThXou/Xtensions.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thxou'

  s.ios.deployment_target = '9.0'
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
