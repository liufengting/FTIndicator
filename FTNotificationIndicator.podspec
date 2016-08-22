Pod::Spec.new do |s|

  s.name         = "FTNotificationIndicator"
  s.version      = "1.1.2"
  s.summary      = "A lightwight local notification UI, with blur effect, elegant API and themes Support."
  s.description  = <<-DESC
          A lightwight local notification, with blur effect, elegant API and themes Support. Inspried by Apple's  notifications.
                   DESC
  s.author             = { "liufengting" => "wo157121900@me.com" }
  s.homepage     = "https://github.com/liufengting/FTIndicator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.social_media_url   = "http://twitter.com/liufengting"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/liufengting/FTIndicator.git", :tag => "#{s.version}" }
  s.source_files  = "FTNotificationIndicator", "FTIndicator/FTNotificationIndicator/*.{h,m}"
  s.requires_arc = true

end