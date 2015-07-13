Pod::Spec.new do |s|
  s.name         = "ABDataSourceController"
  s.version      = “1.0.1”
  s.summary      = "Simple to use approach to clean your UITableView data source & delegate code from your UIViewController and share it between controllers."
  s.homepage     = "https://github.com/alexbumbu/ABDataSourceController"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = {"Alex Bumbu" => "https://github.com/alexbumbu"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/alexbumbu/ABDataSourceController.git", :tag => “1.0.1” }
  s.source_files  = "ABDataSourceController"
  s.requires_arc = true
end
