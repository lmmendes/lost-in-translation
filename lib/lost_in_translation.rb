# load configuration files

$stdout.puts "Lost in translation!"

#require 'sqlite3'
#require 'active_record'

require 'lost_in_translation/i18n/i18n_ext'

module LostInTranslation

  ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => File.join(Rails.root,'db/lost_in_translation-development.db'))

  autoload :Locale      , 'lost_in_translation/app/models/locale'
  autoload :Translation , 'lost_in_translation/app/models/translation'
  autoload :I18n        , 'lost_in_translation/i18n'
  autoload :Server      , 'lost_in_translation/server'
end