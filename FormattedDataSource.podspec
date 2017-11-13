Pod::Spec.new do |s|
  s.name             = 'FormattedDataSource'
  s.version          = '0.1.0'
  s.summary          = 'Simple text formatting in Swift.'

  s.description      = <<-DESC
This framework provide to use multiple dataSource for collection of table view
                       DESC

  s.homepage         = 'https://github.com/luximetr/FormattedDataSource'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luximetr' => 'alexandr.orlov@brander.ua' }
  s.source           = { :git => 'https://github.com/luximetr/FormattedDataSource.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/**/*'
  s.dependency 'SnapKit', '~> 4.0.0'
end
