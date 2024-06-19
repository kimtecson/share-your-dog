class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index

    if params[:query].present?
      @dogs = Dog.search_by(params[:query])
    else
      @dogs = Dog.all
    end
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
    @dog.user = @owner
    if @dog.save
      redirect_to dog_path(@dog)
      puts 'saved'
    else
      render 'new', status: :unprocessable_entity
      puts 'not saved'
    end
  end

  def new
    @owner = current_user
    @dog = Dog.new
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :price, :description, photos: [])
  end
end
