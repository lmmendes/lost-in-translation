require 'erb'

module LostInTranslation
  class Server < Sinatra::Application
    use Rack::MethodOverride
    
    
    set :views  , File.expand_path(File.join(File.dirname(__FILE__), 'app', 'views'))
    set :layout , File.expand_path(File.join(File.dirname(__FILE__), 'app', 'views', 'layouts'))
    
    helpers do
      include Rack::Utils
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
    
    def show(page, options={})
       options[:layout] = :layout unless options.has_key?(:layout)
       erb page.is_a?(String) ? page.to_sym : page , options
    end
    
    get '/' do
      #"These are not the droids you are looking for..."
      @missing = LostInTranslation::Locale.joins(:translations).where('translations.missing = ?', true).group('locales.name').order('locales.name ASC')
      show 'home/index.html'
    end
    
    get '/translation/:id' do
      @translation = Translation.find(params[:id])
      show 'translation/edit.html'
    end
    
    post '/translation/:id' do
      @translation = Translation.find(params[:id])
      @translation.update_attributes(params[:translation].merge(:missing=>false))
      if @translation.save
        "salvo"
      else
        show 'translation/edit.html'
      end
    end
    
  end
end