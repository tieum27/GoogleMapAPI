class CondosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_condo, only: [:show, :edit, :update, :destroy]
  # GET /condos
  # GET /condos.json
  def index
    # If statement for the search to return the result
    if params[:search].nil?
      @condos = current_user.condos.all
    else
      @condos = current_user.condos.basic_search(params[:search])
      render '/condos/index.html'
    end

  end

  def Search

  end
  # GET /condos/1
  # GET /condos/1.json
  def show
  end

  # GET /condos/new
  def new
    # @condo = Condo.new
    # New condo after being logged in
    @condo = current_user.condos.new
  end

  # GET /condos/1/edit
  def edit
  end

  # POST /condos
  # POST /condos.json
  # Create new condo after being logged in
  def create
    @condo = current_user.condos.new(condo_params)
    # Success or error message for the creation of the condo
    respond_to do |format|
      if @condo.save
        format.html { redirect_to @condo, notice: 'Condo was successfully created.' }
        format.json { render :show, status: :created, location: @condo }
      else
        format.html { render :new }
        format.json { render json: @condo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condos/1
  # PATCH/PUT /condos/1.json
  def update
    # Success or error message for the update of the condo    
    respond_to do |format|
      if @condo.update(condo_params)
        format.html { redirect_to @condo, notice: 'Condo was successfully updated.' }
        format.json { render :show, status: :ok, location: @condo }
      else
        format.html { render :edit }
        format.json { render json: @condo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condos/1
  # DELETE /condos/1.json
  def destroy
    @condo.destroy
    respond_to do |format|
      format.html { redirect_to condos_url, notice: 'Condo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condo
      @condo = Condo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condo_params
      params.require(:condo).permit(:name, :location, :latittude, :longitude, :city, :state, :country, :zip_code, :phone_number, :hours, :image)
    end
end
