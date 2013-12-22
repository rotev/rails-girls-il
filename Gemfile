source "https://rubygems.org"

ruby "2.0.0"

gem "slim"

gem "bourbon", :require => false

gem "middleman", :git => "git@github.com:paulcpederson/middleman.git"

# Live-reloading plugin
gem "middleman-livereload", "~> 3.1.0"

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end

# to sync to s3
# gem "middleman-sync", "~> 3.0.11"
gem 'middleman-s3_sync'

# gem 'image_optim', :git => 'git@github.com:manofstone/image_optim.git'
# image optimization
# gem "middleman-imageoptim", :github => "manofstone/middleman-imageoptim"
gem "middleman-imageoptim"

# google closure compiler
gem "closure-compiler"

# for deploying to rackspace cloud
gem "middleman-deploy"

gem 'sanitize'

gem "maruku"

gem "middleman-syntax"