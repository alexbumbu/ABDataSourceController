Pod::Spec.new do |s|
  s.name         = "ABDataSourceController-swift"
  s.version      = "1.0.0"
  s.platform     = :ios, "8.0"
  s.summary      = "Simple to use approach to clean your UITableView data source & delegate code from your UIViewController and share it between controllers."
  s.homepage     = "https://github.com/alexbumbu/ABDataSourceController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = {"Alex Bumbu" => "https://github.com/alexbumbu"}
  s.source       = { :git => "https://github.com/alexbumbu/ABDataSourceController.git", :tag => "1.0.0" }
  s.source_files  = "ABDataSourceController/**/*.{swift}"
  s.requires_arc = true
end
