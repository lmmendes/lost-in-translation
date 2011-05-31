module I18n
  class << self
    alias :legacy_handle_exception :handle_exception  
    private
      
      if I18n::VERSION >= '0.6.0'
        def handle_exception(handling, exception, locale, key, option)
          log_missing_translation(locale,key)
          send :legacy_handle_exception, handling, exception, locale, key, option
        end
      else
        def handle_exception(exception, locale, key, option)
          log_missing_translation(locale,key)
          send :legacy_handle_exception, exception, locale, key, option
        end
      end
      
      def log_missing_translation(locale,key)
        puts "Kapoow! key missing: #{key} for #{locale}"
        if I18n.backend && I18n.backend.store.is_a?(LostInTranslation::I18n::Backend)
          I18n.backend.store.log_missing_translation(locale,key)
        end
      end
      
  end
end