module LostInTranslation
  module I18n
    $stdout.puts "Module i18n called"
    autoload :Backend, 'i18n/backend'
  end
end