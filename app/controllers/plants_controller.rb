class PlantsController < ApplicationController
  def index
      @plants = current_user.garden.plants
  end

  def new
    @plant = Plant.new
  end

  def create
    garden = current_user.garden
    @plant = garden.plants.create(plant_params)
    if @plant.save
      redirect_to plants_path(@plant.id)
      flash[:success] = "Your plant was added"
    else
      @errors = @plant.errors
      render :new
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def edit
    @user = current_user
    @garden = @user.garden
    @plant = @garden.plants.find(params[:id])
  end

  def update
    @user = current_user
    @garden = @user.garden
    @plant = @garden.plants.find(params[:id])
    if @plant.update(update_params)
      flash[:success]= "Your plant is updated"
      redirect_to plants_path
    else
      flash[:error]= "Your plant did not update"
      render :new
    end 
  end

  def water
    plant = Plant.find(params[:id])
    plant.water_plant
    redirect_to plants_path
  end

  def water_all
    current_user.garden.plants.each do |plant|
      plant.water_plant
    end
    redirect_to plants_path
  end

  private

  def plant_params
   params.permit(:name, :species, :frequency)
  end

  def update_params
    params.require(:plant).permit(:name, :species, :frequency)
  end
end
