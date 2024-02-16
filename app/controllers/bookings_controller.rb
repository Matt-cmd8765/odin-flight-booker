class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @no_of_passengers = params[:no_of_passengers]
    @flight_id = params[:flight_id]
    @no_of_passengers.to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
  
    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_path(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end 

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
