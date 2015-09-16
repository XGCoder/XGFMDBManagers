Pod::Spec.new do |s|

  s.name         = "XGFMDBManagers"
  s.version      = "0.0.4"
  s.summary      = "自己封装的FMDB 数据 随便存 随便取
		    声明: 使用前请先查看 README.md 文件"
  s.homepage     = "https://github.com/zhaoxiaoga/XGFMDBManagers"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "赵小嘎" => "15110241511@163.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/zhaoxiaoga/XGFMDBManagers.git", :tag => s.version }
  s.source_files  = "XGFMDBManagers/XGFMDBManagers/XGDB", "XGFMDBManagers/XGFMDBManagers/XGDB/**/*.{h,m}"
  s.requires_arc = true
  s.dependency   "FMDB", "~> 2.0" 
   
  # s.exclude_files = "Classes/Exclude"
end
