
module LostInTranslation
  class Server < Sinatra::Application
    use Rack::MethodOverride
    
    get '/' do
      "These are not the droids you are looking for..."
    end
    
    # POST
    # :locale => 'pt'
    # :key    => 'model.invalid_phone_number'
    get "/translation/new" do
      "translation missing for #{params[:locale]} key: #{params[:key]}"
      Translation.create!
    end
    
    # get the content of locale
    get '/translation/:locale' do
    end
    
    # get only the specific :locale, :key
    get '/translation/:locale/:key' do
    end
    
  end
end