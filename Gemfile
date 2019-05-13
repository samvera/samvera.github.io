source "https://rubygems.org"

# gem 'wdm'

# gem 'documentation-theme-jekyll', github: 'elrayle/documentation-theme-jekyll', branch: 'gh-pages'

# gem 'github-pages', group: :jekyll_plugins
gem 'ffi', '>= 1.9.24'
gem 'github-pages' # plugins will not run if group: :jekyll_plugins is used
gem 'html-proofer'
gem "jekyll", ">= 3.6.3"
gem 'rake'
gem 'nokogiri', '>=1.8.2'
gem 'rubyzip', '>= 1.2.2'

group :development, :test do
  gem "rspec"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "capybara"
  gem 'launchy'
  gem "rack-jekyll"
  gem "pry-byebug"
  gem 'rspec_junit_formatter'
end

if ENV['RAILS_VERSION']
  if ENV['RAILS_VERSION'] == 'edge'
    gem 'rails', github: 'rails/rails'
    ENV['ENGINE_CART_RAILS_OPTIONS'] = '--edge --skip-turbolinks'
  else
    gem 'rails', ENV['RAILS_VERSION']
  end
end
