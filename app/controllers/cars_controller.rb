class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index, :show]


  # GET /cars
  def index
    @cars = []
    @styles=[]
    if params[:car].nil?
      if params[:styles] || params[:search_value]
        @styles = params[:styles]
        @search_value = params[:search_value]
        @cars = find_cars_of_attribute("style", @styles) & find_cars_of_brands(@search_value)
      else
        @brands = policy_scope(Brand).all
        @cars = policy_scope(Car).all

      end
    else
      @cars = find_cars_of_brands(params[:car][:brand]) & find_cars_of_attribute("trans_type", params[:car][:trans_type]) & find_cars_below_attribute("price", params[:car][:price]) & find_cars_below_attribute("odometer", params[:car][:odometer]) & find_cars_above_attribute("year", params[:car][:year]) & find_cars_of_attribute("size", params[:car][:size]) & find_cars_of_attribute("style", params[:car][:style]) & find_cars_of_attribute("drive", params[:car][:drive]) & find_cars_of_attribute("doors", params[:car][:doors]) & find_cars_of_attribute("trans_speeds", params[:car][:trans_speeds])
    end
  end

  # GET /cars/1
  def show
    @appointment = Appointment.new()
  end

  # GET /cars/new
  def new
    @collections = policy_scope(SearchDatum).standard_data
    @brand_selected = Brand.find_by(brand_name: params[:brand_name])

    if @brand_selected
      @models = policy_scope(Model).where(brand_id: @brand_selected)
    else
      @models = policy_scope(Model).all
    end

    @car = Car.new
    authorize @car
  end

  def new2
    @car = Car.new()
    authorize @car

  end
  # GET /cars/1/edit
  def edit
    @collections = policy_scope(SearchDatum).standard_data
    @brand_selected = Brand.find_by(brand_name: params[:brand_name] || @car.brand.brand_name)

    if @brand_selected
      @models = policy_scope(Model).where(brand_id: @brand_selected)
    else
      @models = policy_scope(Model).all
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

  def vin
    @car = Car.new
    authorize @car
  end

  def create_from_vin
    vin = car_params[:vin]
    data_hash = policy_scope(Car).vin_data_parse(vin)
    useful = policy_scope(Car).vin_data_extract(data_hash)

    new_brand = Brand.find_by brand_name: data_hash["make"]["name"]
    new_model = Model.find_by name: data_hash["model"]["name"]

    @car = Car.new(useful)
    @car.user = current_user
    @car.model = new_model
    @car.price = useful[:price_suggested]
    authorize @car

    @car.save

    redirect_to edit_car_path(@car)
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
    redirect_to user_path(current_user), notice: 'Car was successfully destroyed.'
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
        @brands = policy_scope(Brand).where("lower(brand_name) LIKE ?", "%#{param.downcase}%")
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
