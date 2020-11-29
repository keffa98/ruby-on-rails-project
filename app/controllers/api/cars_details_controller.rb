class Api::CarsDetailsController < Api::BaseController


  before_action :set_cars_detail, only: [ :show , :edit, :update, :destroy]

  # GET /cars_details
  # GET /cars_details.json
  def index
    @cars_details = @car.carsDetail
  end

  # GET /cars_details/1
  # GET /cars_details/1.json
  def show
  end

  # GET /cars_details/new
  def new
    @cars_detail = @car.carsDetail.build
  end

  # GET /cars_details/1/edit
  def edit
    
  end

  # POST /cars_details
  # POST /cars_details.json
  def create
    
    @cars_detail = CarsDetail.new(cars_detail_params)
    # @cars_detail = @car.carsDetail.build(cars_detail_params)
    respond_to do |format|
      if @cars_detail.save
        format.html { redirect_to api_car_cars_details_url, notice: 'Cars detail was successfully created.' }
        format.json { render :show, status: :created, location: @cars_detail }
      else
        format.html { render :new }
        format.json { render json: @cars_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars_details/1
  # PATCH/PUT /cars_details/1.json
  def update
    
    respond_to do |format|
      
      if @cars_detail.update(cars_detail_params)
        
        format.html { redirect_to api_car_cars_details_url, notice: 'Cars detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @cars_detail }
      else
        raise
        format.html { render :edit }
        format.json { render json: @cars_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars_details/1
  # DELETE /cars_details/1.json
  def destroy
    @cars_detail.destroy
    respond_to do |format|
      format.html { redirect_to api_cars_details_url, notice: 'Cars detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_cars_detail
    @car = Car.find(params[:car_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_cars_detail
      @cars_detail = @car.carsDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cars_detail_params
      params.require(:cars_detail).permit(:Rate, :Avis, :car_id)
    end
end
