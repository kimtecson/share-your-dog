class DogsController < ApplicationController
  def index
    @dogs = Dog.all

    @users = User.where(id: @dogs.extract_associated(:user).uniq.pluck(:id))

    @markers = @users.geocoded.map do |user|

      {
        latitude: user.latitude,
        longitude: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {dogs: user.dogs}),
        marker_html: render_to_string(partial: "marker", locals: {dogs: user.dogs})
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
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @owner = current_user
    @dog = Dog.new
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :price, photos: [])
  end
end
