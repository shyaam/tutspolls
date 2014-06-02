$: << File.expand_path("..", __FILE__)

require "bundler"
Bundler.require
require "app/base"

run Tutspolls::App
