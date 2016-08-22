Pod::Spec.new do |s|

  s.name         = "FTToastIndicator"
  s.version      = "1.1.2"
  s.summary      = "A lightwight toast, with blur effect, elegant API and themes Support."
  s.description  = <<-DESC
          A lightwight toast, with blur effect, elegant API and themes Support. Inspried by Android toasts.
                   DESC
  s.author             = { "liufengting" => "wo157121900@me.com" }
  s.homepage     = "https://github.com/liufengting/FTIndicator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.social_media_url   = "http://twitter.com/liufengting"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/liufengting/FTIndicator.git", :tag => "#{s.version}" }
  s.source_files  = "FTToastIndicator", "FTIndicator/FTToastIndicator/**/*.{h,m}"
  s.requires_arc = true

end