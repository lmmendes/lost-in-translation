require 'erb'

module LostInTranslation
  class Server < Sinatra::Application
    use Rack::MethodOverride
    
    
    set :views  , File.expand_path(File.join(File.dirname(__FILE__), 'app', 'views'))
    set :layout , File.expand_path(File.join(File.dirname(__FILE__), 'app', 'views', 'layouts'))

    helpers LostInTranslation::Helpers
#  end
    
    def show(page, options={})
       options[:layout] = :layout unless options.has_key?(:layout)
       erb page.is_a?(String) ? page.to_sym : page , options
    end
    
    get '/' do
      #"These are not the droids you are looking for..."
      @missing = LostInTranslation::Locale.locales_with_missing_translations
      show 'home/index.html'
    end
    
    get '/translation/:id' do
      @translation = Translation.find(params[:id])
      show 'translation/edit.html'
    end
    
    post '/translation/:id' do
      @translation = Translation.find(params[:id])
      @translation.update_attributes(params[:translation].merge!(:missing=>false))
      if @translation.save!
        "salvo"
      else
        show 'translation/edit.html'
      end
    end
    
  end
end