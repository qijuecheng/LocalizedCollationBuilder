#
#  Be sure to run `pod spec lint LocalizedCollationBuilder.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "LocalizedCollationBuilder"
  s.version      = "1.0.0"
  s.summary      = "Sort by alphabet or Chinese pinyin."
  s.homepage     = "https://github.com/qijuecheng/LocalizedCollationBuilder.git"
  s.license      = "MIT"
  s.author             =  "漆珏成"

  s.source       = { :git => "https://github.com/qijuecheng/LocalizedCollationBuilder.git", :tag => "#{s.version}" }
  s.source_files = "LocalizedCollationBuilder/*.{h,m}"
end
