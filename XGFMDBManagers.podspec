Pod::Spec.new do |s|

  s.name         = "XGFMDBManagers"
  s.version      = "0.0.1"
  s.summary      = "自己封装的FMDB 字典 模型 字符串 随便存 随便取"

  s.description  = <<-DESC
                   A longer description of XGFMDBManagers in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC


  s.homepage     = "https://github.com/zhaoxiaoga/XGFMDBManagers"
  s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "赵小嘎" => "15110241511@163.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/zhaoxiaoga/XGFMDBManagers.git", :tag => "0.0.1" }
  s.source_files  = "XGFMDBManagers", "XGFMDBManagers/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
end
