require 'rubygems'
require "bundler/setup"

Bundler.require(:default)

require './app'
require 'execjs'
run Sinatra::Application
