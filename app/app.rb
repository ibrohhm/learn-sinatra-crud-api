require 'sinatra/base'
require 'sinatra/json'
require_all './app/controller/*rb'

class App < Sinatra::Base
  get '/healthz' do
    [200, 'ok']
  end

  get '/products' do
    ProductsController.call(env)
  end

  get '/products/:id' do
    ProductsController.call(env)
  end

  post '/products' do
    ProductsController.call(env)
  end

  patch '/products/:id' do
    ProductsController.call(env)
  end

  delete '/products/:id' do
    ProductsController.call(env)
  end
end
