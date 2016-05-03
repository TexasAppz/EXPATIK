class CityPagesController < ApplicationController
  before_action :set_city_page, only: [:show, :edit, :update, :destroy]

  # GET /city_pages
  # GET /city_pages.json
  def index
    @city_pages = CityPage.all
  end

  # GET /city_pages/1
  # GET /city_pages/1.json
  def show
    @books = HTTParty.get "https://www.googleapis.com/books/v1/volumes?q=#{CityPage.find(params[:id]).city}+expats&key=AIzaSyBi-ieqecE99YvszjWHBtq_eZORbhN-8HQ"
    @books = JSON.parse @books.body
    p @books["items"][0]["accessInfo"]["webReaderLink"]
    @books_all = [@books["items"][0],
                  @books["items"][1],
                  @books["items"][2]
                ]

  end

  # GET /city_pages/new
  def new
    @city_page = CityPage.new
  end

  # GET /city_pages/1/edit
  def edit
  end

  # POST /city_pages
  # POST /city_pages.json
  def create
    @city_page = CityPage.new(city_page_params)

    respond_to do |format|
      if @city_page.save
        format.html { redirect_to @city_page, notice: 'City page was successfully created.' }
        format.json { render :show, status: :created, location: @city_page }
      else
        format.html { render :new }
        format.json { render json: @city_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_pages/1
  # PATCH/PUT /city_pages/1.json
  def update
    respond_to do |format|
      if @city_page.update(city_page_params)
        format.html { redirect_to @city_page, notice: 'City page was successfully updated.' }
        format.json { render :show, status: :ok, location: @city_page }
      else
        format.html { render :edit }
        format.json { render json: @city_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_pages/1
  # DELETE /city_pages/1.json
  def destroy
    @city_page.destroy
    respond_to do |format|
      format.html { redirect_to city_pages_url, notice: 'City page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_page
      @city_page = CityPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_page_params
      params.require(:city_page).permit(:city, :country, :continent, :article, :g_map, :twitter_feed, :book_suggestion)
    end
end
