require 'erb'

module LostInTranslation
  class Server < Sinatra::Application
    use Rack::MethodOverride
    
    set :views, File.expand_path(File.join(File.dirname(__FILE__), 'app', 'views'))
    
    get '/' do
      #"These are not the droids you are looking for..."
      @missing = LostInTranslation::Locale.include(:translation).where(:missing => true).group('locale.name')
      erb 'home/index.html'.to_sym
    end
    
    
  end
end