require 'rubygems'
require "bundler/setup"
require 'execjs'

Bundler.require(:default)

require './app'
run Sinatra::Application
