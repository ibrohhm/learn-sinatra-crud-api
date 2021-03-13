class ProductsController < ApplicationController
  get '/products' do
    products = Product.all

    [200, HEADER, products.to_json]
  end

  get '/products/:id' do
    begin
      product = Product.find params[:id]
    rescue StandardError => e
      halt [500, HEADER, {error: e.message}.to_json]
    end

    [200, HEADER, product.to_json]
  end

  post '/products' do
    product = Product.new

    begin
      Service::Products::Create.new(product, payload).call
    rescue StandardError => e
      halt [500, HEADER, {error: e.message}.to_json]
    end

    [201, HEADER, product.to_json]
  end

  patch '/products/:id' do
    product = Product.find params[:id]

    begin
      Service::Products::Update.new(product, payload).call
    rescue StandardError => e
      halt [500, HEADER, {error: e.message}.to_json]
    end

    [200, HEADER, product.to_json]
  end

  delete '/products/:id' do
    begin
      product = Product.find params[:id]
      product.destroy
    rescue StandardError => e
      halt [500, HEADER, {error: e.message}.to_json]
    end

    [200, HEADER, 'success delete']
  end
end
