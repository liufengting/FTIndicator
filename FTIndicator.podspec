Pod::Spec.new do |s|

  s.name         = "FTIndicator"
  s.version      = "1.2.2"
  s.summary      = "A lightwight UI package contains local notification, progress HUD, toast, with blur effect, elegant API and themes Support."
  s.description  = <<-DESC
          A lightwight UI package contains local notification, progress HUD, toast, with blur effect, elegant API and themes Support. Inspried by Apple's process indicator and notifications.
                   DESC
  s.author             = { "liufengting" => "wo157121900@me.com" }
  s.homepage     = "https://github.com/liufengting/FTIndicator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.social_media_url   = "http://twitter.com/liufengting"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/liufengting/FTIndicator.git", :tag => "#{s.version}" }
  s.source_files  = "FTIndicator", "FTIndicator/**/*.{h,m}"
  s.resources    = "FTIndicator/**/*.{bundle}"
  s.requires_arc = true
  
  s.subspec 'FTNotificationIndicator' do |bs|
    bs.source_files  = "FTNotificationIndicator", "FTIndicator/FTNotificationIndicator/*.{h,m}"
  end

  s.subspec 'FTProgressIndicator' do |bs|
    bs.source_files  = "FTProgressIndicator", "FTIndicator/FTProgressIndicator/*.{h,m}"
    bs.resources    = "FTIndicator/FTProgressIndicator/*.{bundle}"
  end

  s.subspec 'FTToastIndicator' do |bs|
    bs.source_files  = "FTToastIndicator", "FTIndicator/FTToastIndicator/**/*.{h,m}"
  end


end
