require 'nokogiri'
require 'net/http'
require 'yaml'
require 'wrest'
require 'formatador'

Dir['./lib/**/*.rb'].each { |f| require f }
