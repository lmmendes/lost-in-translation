require 'i18n/backend/base'

module LostInTranslation
  module I18n
    class Backend
      
      def initialize()
        
        def [](key)
          key  = key.to_s
          keys = key.split('.')
          locale = keys.shift
          key    = keys.join('.')
          $stdout.puts "locale: #{locale} key: #{key}"
          locale = LostInTranslation::Locale.where(:name => locale).first
          if locale
            return locale.translations.where( :keyname => key ).first.try(:value)
          end
        end
        
        def []=(key,value)
          $stdout.puts "key: #{key} - value: #{value}"
          key = key.to_s
          value = value.to_s
          keys = key.split('.')
          locale = keys.shift
          key    = keys.join('.')
          $stdout.puts "locale: #{locale} key: #{key} value: #{value}"
          locale = LostInTranslation::Locale.find_or_create_by_name(locale)
          translation = locale.translations.find_or_create_by_keyname( key )
          translation = value
          locale.save
        end
        
        def log_missing_translation(locale,key)
          $stdout.puts "==> EXCEPTION: log_missing_translation"
          $stdout.puts "locale: #{locale} key: #{key}"
          locale = LostInTranslation::Locale.find_or_create_by_name(locale)
          translation = locale.translations.find_or_create_by_keyname( key )
          translation.missing=1
          locale.save!
        end
        
      end
    end
  end
end