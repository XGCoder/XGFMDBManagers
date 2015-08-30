Pod::Spec.new do |s|

  s.name         = "XGFMDBManagers"
  s.version      = "0.0.1"
  s.summary      = "自己封装的FMDB 字典 模型 字符串 随便存 随便取"
  s.homepage     = "https://github.com/zhaoxiaoga/XGFMDBManagers"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "赵小嘎" => "15110241511@163.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/zhaoxiaoga/XGFMDBManagers.git", :tag => s.version }
  s.source_files  = "XGFMDBManagers/XGFMDBManagers/XGDB", "XGFMDBManagers/XGFMDBManagers/XGDB/**/*.{h,m}"
  s.requires_arc = true
  
  # s.exclude_files = "Classes/Exclude"
end
