#
#  Be sure to run `pod spec lint LocalizedCollationBuilder.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "LocalizedCollationBuilder"
  s.version      = "0.0.1"
  s.summary      = "根据字母或者中文拼音排序"
  s.homepage     = "https://github.com/qijuecheng/LocalizedCollationBuilder"
  s.license      = "MIT"
  s.author             =  "漆珏成"
  s.swift_version = "4.0"
  s.platform = :ios, "9.0"
  s.source       = { :git => "https://github.com/qijuecheng/LocalizedCollationBuilder.git", :tag => "#{s.version}" }
  s.source_files = "LocalizedCollationBuilder/*.swift"
end
