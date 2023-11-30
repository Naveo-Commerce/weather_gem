if ENV['RCOV']
  require 'simplecov'
  SimpleCov.adapters.define 'custom' do
    add_filter '/spec/'
    add_filter '/config/'
  end

  SimpleCov.start 'custom'
end

require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'webmock/rspec'
require File.dirname(__FILE__) + '/../lib/weather_client'