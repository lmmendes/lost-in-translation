# Lost in Translation

## Features

Is a I18n (internalization) management tool with a built-in web interface (Sinatra based) enabling easy translations.

* Has a I18n backend that can be cupeled in to a Rails app or any app that uses the I18n gem.
* Can be mounted inside the Rails app
* Auto detects 'missing translations' and displays then in the the translation dashboard


## How to install in a Rails 3 app

Using you favorite editor create  a file called 'lost_in_translations_i18_backend.rb' and put it inside Rais.root/config/initializers folder with the following code:
 
  I18n.backend = I18n::Backend::KeyValue.new(LostInTranslation::I18n::Backend.new)
  
Then edit your routes file and add to it the following:

  mount LostInTranslation::Server.new, :at => '/lost_in_translation'

In your Gemfile for now add the following dependencies:

  gem 'sqlite3'
  gem 'sinatra'

Finally run the rake task to create the support tables for the Lost in Translation gem!

  rake lost_in_translation:db:migrate
  
  

