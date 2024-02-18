source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

gem "bootsnap", require: false
gem 'foreman'
gem "importmap-rails"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "redis", "~> 4.0"
# gem "bcrypt", "~> 3.1.7"
# gem "image_processing", "~> 1.2"
gem 'rails_live_reload'

# gem "kredis"
# gem "rack-mini-profiler"
# gem "sassc-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]


# Development and Test
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "rspec-rails", "~> 6.0.0"
end

# Development-only
group :development do
  gem "web-console"
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "draft_generators"
  gem "grade_runner"
  gem "pry-rails"
  gem "rails_db"
  gem "rails-erd"
  gem "rufo"
  gem "specs_to_readme"
  gem "web_git"
end

# Test-only
group :test do
  gem "draft_matchers"
  gem "rspec-html-matchers"
  gem "webmock"
end

# AppDev Gems
# ===========
gem "appdev_support"
gem "awesome_print"
gem "devise"
gem "dotenv-rails"
gem "faker"
gem "htmlbeautifier"
gem "http"
gem "sqlite3", "~> 1.4"
gem "table_print"
