source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
group :development, :test do
# Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :production do
# Use pg in production mode
  gem 'pg', '~> 0.18.2'
end

gem 'activeadmin', github: 'activeadmin'
gem 'devise'
gem 'devise_invitable', '~> 1.4.2'
gem 'cancan' # or cancancan
gem 'draper'
gem 'pundit'
gem "rmagick"
gem "carrierwave"
gem 'acts-as-taggable-on', '~> 3.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.4'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'newrelic_rpm'

