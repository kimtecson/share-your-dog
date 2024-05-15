class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    @markers = @flats.geocoded.map do |flat|
      {
        latitutde: user.latitude,
        longitute: user.longitude
      }
    end
  end

  def show
    @dog = Dog.find(params[:id])
    @booking = Booking.new
  end

  def create
    @owner = current_user
    @dog = Dog.new(dog_params)
    @dog.owner = @owner
    @dog.save
    if @dog.id
      redirect_to dog_path(@dog)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @owner = current_user
    @dog = Dog.new(dog_params)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :price, :photos [])
  end

end
