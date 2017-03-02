class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index, :show]


  # GET /cars
  def index
    if params[:car].nil?
      if params[:search_value].nil?
        @brands = Brand.all
        @cars = Car.all
      else
        find_cars_of_brands( params[:search_value] )
      end
    else
      @cars = find_cars_of_brands(params[:car][:brand]) & find_cars_of_transmission(params[:car][:transmission]) & find_cars_of_price(params[:car][:price])
    end
  end

  # GET /cars/1
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new()
    if params[:brand_name]
      @brand_selected = Brand.find_by(brand_name: params[:brand_name])
      @models = Model.where(brand_id: @brand_selected)

    else
      @models = Model.all
      @brand_selected = Brand.all.first
    end


  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  def create
    car_model = Model.find(params[:car][:models][:model_id].to_i)
    @car = Car.new(car_params)
    @car.model_id = car_model.id
    @car.user = current_user

    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      flash[:notice] = "Some error occured"
      render :new
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
    end

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:brand_id, :models, :price, :color, :odometer, :year, :month, :transmission, :fuel_type, :engine_power_cc, :engine_power_hp, :description, photos: [] )
    end

    def find_cars_of_brands(param)
      if param.blank?
        @cars = Car.all
      else
        @brands = Brand.where("brand_name LIKE ?", "%#{param}%")
        @cars = []
        @brands.each do |brand|
          @cars << brand.cars
        end
        @cars.flatten!
      end
    end

    def find_cars_of_transmission(param)
      if param.blank?
        @cars = Car.all
      else
        @cars = Car.where(transmission: param)
      end
    end

    def find_cars_of_price(param)
      if param.blank?
        @cars = Car.all
      else
        @cars = Car.where("price <= #{param}")
      end
    end
  end
