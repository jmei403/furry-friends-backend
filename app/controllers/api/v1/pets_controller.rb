class Api::V1::PetsController < ApplicationController
  require 'rest-client'
  before_action :get_token

  def index
    url = "https://api.petfinder.com/v2/animals?location=#{current_user.postcode}&limit=100"
    headers = { Authorization: "#{@token["token_type"]} #{@token["access_token"]}" }

    response = RestClient.get(url, headers)

    render json: response
  end

  def show
    pet_id = params[:id] # id from API
    url = "https://api.petfinder.com/v2/animals/#{pet_id}"
    headers = { Authorization: "#{@token["token_type"]} #{@token["access_token"]}" }

    response = RestClient.get(url, headers)

    render json: response
  end

  def get_type
    type = params[:type]   # get type through params from frontend
    url = "https://api.petfinder.com/v2/animals?location=#{current_user.postcode}&limit=100&type=#{type}"
    headers = { Authorization: "#{@token["token_type"]} #{@token["access_token"]}" }

    response = RestClient.get(url, headers)

    render json: response
  end

  private

  def get_token
    url = "https://api.petfinder.com/v2/oauth2/token"

    payload = {
      grant_type: 'client_credentials',
      client_id: 'mCkpfVdzgRe5tTbgQlEQdT0AiIT9DGeIVwiWcVK37t6siNVIra',
      client_secret: '1GX00eIukyRAAS5jgL5f1MbmjtJ1NJZBB4lP79Um'
    }

    response = RestClient.post(url, payload)
    @token = JSON.parse(response)
  end
end
