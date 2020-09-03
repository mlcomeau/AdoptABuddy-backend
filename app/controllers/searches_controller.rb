class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :update, :destroy]

  # GET /searches
  def index
    @searches = Search.all

    render json: @searches
  end

  # GET /searches/1
  def show
    render json: @search
  end

  # POST /searches
  def create
    @search = Search.new(search_params)

    if @search.save
      render json: @search, status: :created
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end
  
  def search_results
    byebug
    type = "dog"
    gender = "male"
    size = "small"
    location = "97214"
    distance = "100"
    url = URI("https://api.petfinder.com/v2/animals?type=#{type}&gender=#{gender}&size=#{size}&location=#{location}&distance=#{distance}")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = ENV['TOKEN']

    response = https.request(request)

    render json: response.body
  end 

  # DELETE /searches/1
  def destroy
    @search.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def search_params
      params.fetch(:search, {})
    end
end

