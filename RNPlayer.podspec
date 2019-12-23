Pod::Spec.new do |s|
  s.name         = "RNPlayer"
  s.version      = "1.0.0"
  s.summary      = "RNPlayer"
  s.description  = <<-DESC
                  RNPlayer
                   DESC
  s.homepage     = "https://github.com/HAIHAI211/react-native-geek-player"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "harrison" => "851596652@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/HAIHAI211/react-native-geek-player.git", :tag => "master" }
  s.source_files  = "ios/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "SuperPlayer"

end

