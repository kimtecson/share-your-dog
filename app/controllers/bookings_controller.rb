class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @user = current_user
    @bookings = @user.bookings
    @owner_bookings = @user.bookings_as_owner
  end

  def create
    @user = current_user
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.dog = @dog
    @booking.user = @user
    @booking.status = "pending"
    @booking.total_price = @dog.price * (@booking.end_time - @booking.start_time) * 24
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to bookings_path, status: :unprocessable_entity
    end
  end

  def new
    @booking = Booking.new(booking_params)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      # render # where was the booking update form?
      redirect_to bookings_path, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :dog_id, :user_id, :status)
  end
end
