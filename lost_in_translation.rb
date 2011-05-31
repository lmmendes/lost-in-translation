# load configuration files

$stdout.puts "Loading Lost in Translation..."

require 'sqlite3'
require 'active_record'

link = ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => File.join(Rails.root,'db/lost_in_translation-development.db'))

$stdout.puts "ActiveRecord Models: #{File.expand_path(File.join(File.dirname(__FILE__), 'app', 'models', '*'))}"

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'app', 'models', '*'))].each do |model|
  $stdout.puts "Loading model #{model} "
  require model
end

[
  'i18n_ext',
  'i18n_backend',
  'server'
].each do |file|
  require File.join(File.dirname(__FILE__), 'lib', file )
end