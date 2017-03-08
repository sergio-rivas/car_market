class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index, :show]


  # GET /cars
  def index
    if params[:car].nil?
      if params[:search_value].nil?
        @brands = policy_scope(Brand).all
        @cars = policy_scope(Car).all
      else
        @search_value = params[:search_value]
        find_cars_of_brands(@search_value)
      end
    else
      @cars = find_cars_of_brands(params[:car][:brand]) & find_cars_of_attribute("trans_type", params[:car][:trans_type]) & find_cars_below_attribute("price", params[:car][:price]) & find_cars_below_attribute("odometer", params[:car][:odometer]) & find_cars_above_attribute("year", params[:car][:year]) & find_cars_of_attribute("size", params[:car][:size]) & find_cars_of_attribute("style", params[:car][:style]) & find_cars_of_attribute("drive", params[:car][:drive]) & find_cars_of_attribute("doors", params[:car][:doors])

    end
  end

  # GET /cars/1
  def show
    @appointment = Appointment.new()
  end

  # GET /cars/new
  def new
    @car = Car.new()
    authorize @car
  end

  # GET /cars/1/edit
  def edit
    if params[:brand_name]
      @brand_selected = Brand.find_by(brand_name: params[:brand_name])
      @models = policy_scope(Model).where(brand_id: @brand_selected)
    else
      @models = policy_scope(Model).all
      @brand_selected = policy_scope(Brand).all.first
    end
  end

  # POST /cars
  def create

    car_model = Model.find(params[:car][:models][:model_id].to_i)
    @car = Car.new(car_params)
    @car.model_id = car_model.id
    @car.user = current_user
    authorize @car

    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      flash[:notice] = "Some error occured"
      render :new
    end
  end

  # POST /cars/new
  def create_via_vin

    unless car_params[:vin].nil? || car_params[:vin] == ""
      vin = car_params[:vin]
      data_hash = policy_scope(Car).vin_data_parse(vin)
      useful = policy_scope(Car).vin_data_extract(data_hash)

      new_brand = Brand.find_by brand_name: data_hash["make"]["name"]
      new_model = Model.find_by name: data_hash["model"]["name"]

      @car = Car.new(useful)
      @car.user = current_user
      @car.model = new_model
      authorize @car

      @car.save

      render :new2
    else
      @car = Car.new()
      authorize @car
      if params[:brand_name]
        @brand_selected = Brand.find_by(brand_name: params[:brand_name])
        @models = policy_scope(Model).where(brand_id: @brand_selected)
      else
        @models = policy_scope(Model).all
        @brand_selected = policy_scope(Brand).all.first
      end
      render :new2
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    redirect_to cars_url, notice: 'Car was successfully destroyed.'
  end

  def search

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
      authorize @car
    end

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:brand_id, :vin, :mpg_city, :mpg_highway, :size, :style, :price_suggested, :color_ext, :color_int, :trans_speeds, :trans_type, :doors, :drive, :models, :price, :odometer, :year, :fuel_type, :description, photos: [] )
    end

    def find_cars_of_brands(param)
      if param.blank?
        @cars = policy_scope(Car).all
      else
        @brands = policy_scope(Brand).where("brand_name LIKE ?", "%#{param}%")
        @cars = []
        @brands.each do |brand|
          @cars << brand.cars
        end
        @cars.flatten!
      end
    end

    def find_cars_of_attribute(attribute, param)
      if param.blank?
        @cars = policy_scope(Car).all
      else
        @cars = policy_scope(Car).where(attribute.to_sym => param)
      end
    end

    def find_cars_below_attribute(attribute, param)
      if param.blank?
        @cars = policy_scope(Car).all
      else
        @cars = policy_scope(Car).where("#{attribute} <= ?", param.to_i)
      end
    end

    def find_cars_above_attribute(attribute, param)
      if param.blank?
        @cars = policy_scope(Car).all
      else
        @cars = policy_scope(Car).where("#{attribute} >= ?", param.to_i)
      end
    end

  end
