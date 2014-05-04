Pod::Spec.new do |s|
  s.name             = "SAScrollTableViewCell"
  s.version          = "0.1.0"
  s.summary          = "UITableViewCell with scrolling media: images, videos, sound etc..."
  s.homepage         = "https://github.com/shams-ahmed/SAScrollTableViewCell"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "shams ahmed" => "shamsahmed@me.com" }
  s.source           = { :git => "https://github.com/shams-ahmed/SAScrollTableViewCell.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets/*.png'

  s.frameworks = 'MediaPlayer'
end
