DEFAULT_ENV = "development"

require 'pry'
require 'sqlite3'
require 'active_record'
require "sinatra/activerecord"
require 'sinatra/contrib'

require_relative "../lib/cli"
require_relative "../lib/pet"