require File.join(File.dirname(__FILE__),'helpers','partials')

module LostInTranslation
  module Helpers
 #   autoload :Partials, 'helpers/partials'
    
    include Rack::Utils
    include LostInTranslation::Helpers::Partials
    alias_method :h, :escape_html

    def path_prefix
      request.env['SCRIPT_NAME']
    end
    
    def current_page
      url request.path_info.sub('/','')
    end
    
    def url(*path_parts)
      [ path_prefix, path_parts ].join('/').squeeze('/')
    end
    
  end
end