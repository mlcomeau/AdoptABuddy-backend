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
    # ---------- compose bearer token request 
    id = ENV['CLIENT_ID']
    secret = ENV['CLIENT_SECRET']
    uri = URI.parse("https://api.petfinder.com/v2/oauth2/token")

    request = Net::HTTP::Post.new(uri)
    request.set_form_data(
      "client_id" => "#{id}",
      "client_secret" => "#{secret}",
      "grant_type" => "client_credentials",
    )    
       
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    
    #send bearer token request 
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end


    #turn JSON response into hash so we can use its data 
    resp = JSON.parse(response.body) 

    #assign bearer token from resp to a variable 
    token = resp['access_token']
    
    # -------- get data from search form 
    type = params[:animal]
    location = params[:location]
    distance = params[:searchRadius]

    # --------- compose PetFinder API endpoint URL
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

    # --------- the search request 
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request2 = Net::HTTP::Get.new(url)
    request2["Authorization"] = "Bearer #{token}"

    response2 = https.request(request2)

    render json: response2.body
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


