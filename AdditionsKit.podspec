Pod::Spec.new do |s|

s.name         = "AdditionsKit"
s.version      = "1.0.0"
s.summary      = "additions"
s.description  = <<-DESC
some additions
DESC
s.homepage     = "https://github.com/AssassinEzio/WXAdditionsKit"
s.license              = { :type => "MIT", :file => "LICENSE" }
s.author             = { "youtu" => "369888297@qq.com" }
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/AssassinEzio/WXAdditionsKit.git", :tag => s.version }
s.source_files  = "WXAdditionsKit/*.{h,m}"
