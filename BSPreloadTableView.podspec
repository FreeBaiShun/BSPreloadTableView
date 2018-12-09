Pod::Spec.new do |s|
s.name         = "BSPreloadTableView"
s.version      = "0.0.3"
s.summary      = "A short description of BSPreloadTableView."
s.description  = <<-DESC
                 一个用来实现上拉下拉，预加载功能的tableView。
DESC
s.homepage     = "https://github.com/FreeBaiShun"
s.license      = "MIT"
s.author             = { "FreeBaiShun" => "851083075@qq.com" }
s.platform     = :ios, "8.0"
s.requires_arc = true
s.source       = { :git => "https://github.com/FreeBaiShun/BSPreloadTableView.git", :tag => "#{s.version}" }
s.source_files  = "BSPreloadTableViewDemo/BSPreloadTableView/BSPreloadTableView/*.{h,m}"
s.dependency 'MJRefresh'
end
