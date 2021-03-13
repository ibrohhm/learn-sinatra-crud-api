require 'sinatra/base'
require 'sinatra/json'

class ApplicationController < Sinatra::Base
  HEADER = { 'Content-type' => 'application/json' }.freeze

  def payload
    return @payload if @payload.present?
    
    @payload =
      begin
        JSON.parse(request.body.read).with_indifferent_access
      rescue JSON::ParserError
        {}
      end
  end
end