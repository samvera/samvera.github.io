source "https://rubygems.org"

gem 'ffi', '>= 1.9.24'
gem 'github-pages' # plugins will not run if group: :jekyll_plugins is used
gem 'html-proofer'
gem "jekyll", ">= 3.6"
# Please see https://github.com/jekyll/jekyll/issues/9231#issuecomment-1379146408
gem "liquid", ">= 4.0.4"
gem 'nokogiri', '>= 1.12'
gem 'rake'
gem 'rubyzip', '>= 1.2.2'

group :development, :test do
  gem "capybara"
  gem "chromedriver-helper"
  gem 'launchy'
  gem "pry-byebug"
  gem "rack-jekyll"
  gem 'rspec_junit_formatter'
  gem "rspec"
  gem "selenium-webdriver"
end

if ENV['RAILS_VERSION']
  if ENV['RAILS_VERSION'] == 'edge'
    gem 'rails', github: 'rails/rails'
    ENV['ENGINE_CART_RAILS_OPTIONS'] = '--edge --skip-turbolinks'
  else
    gem 'rails', ENV['RAILS_VERSION']
  end
end
