require 'rubygems'
require 'bundler'

Bundler.require

configure :development do
  set :database, { adapter: "sqlite3", database: "reservation.sqlite3" }
end

configure :production do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
  use Rack::Auth::Basic do |username, password|
    username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
  end
end

enable :sessions