class SearchesController < ApplicationController

  # GET /searches
  def index
    if logged_in?
      @searches = current_user.searches
      render json: @searches
    else 
      render json: {
        error: "You must be logged in to view searches."
      }
    end 
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
  
  # POST /search_results 
  def search_results
    type = params[:animal]
    location = params[:location]
    distance = params[:searchRadius]

    base_url = "https://api.petfinder.com/v2/animals?type=#{type}&location=#{location}&distance=#{distance}"

    if params[:gender] != "any"
      g = "&gender=#{params[:gender]}"
      base_url += g 
    end 
    if params[:size] != "any"
      s = "&size=#{params[:size]}"
      base_url += s
    end 
    if params[:age] != "any"
      a = "&age=#{params[:age]}"
      base_url += a 
    end 
     
    url = URI(base_url)
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = ENV['TOKEN']

    response = https.request(request)

    render json: response.body
  end 

  # DELETE /searches/1
  def destroy
    @search = Search.find(params[:id])
    @search.destroy 
    render json: {
      data: "Search successfully deleted"
    }
  end

  private
    def search_params
      params.require(:search).permit(:animal, :gender, :size, :age, :user_id)
    end
end


