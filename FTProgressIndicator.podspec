Pod::Spec.new do |s|

  s.name         = "FTProgressIndicator"
  s.version      = "1.0.0"
  s.summary      = "A lightwight progress HUD, with blur effect, elegant API and themes Support."
  s.description  = <<-DESC
          A lightwight progress HUD, with blur effect, elegant API and themes Support. Inspried by Apple's process indicator.
                   DESC
  s.author             = { "liufengting" => "wo157121900@me.com" }
  s.homepage     = "https://github.com/liufengting/FTIndicator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.social_media_url   = "http://twitter.com/liufengting"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/liufengting/FTIndicator.git", :tag => "#{s.version}" }
  s.source_files  = "FTProgressIndicator", "FTIndicator/FTProgressIndicator/*.{h,m}"
  s.resources    = "FTIndicator/FTProgressIndicator/*.{bundle}"
  s.requires_arc = true

end