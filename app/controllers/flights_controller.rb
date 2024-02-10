class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index

    # This is how to get non-repeating airport codes for the dropdown. Not the best way but idgaf
    d_flight_options = Flight.all.map{ |f| [f.departure_airport.code, f.departure_airport_id] }
    @dflights = d_flight_options.uniq
    a_flight_options = Flight.all.map{ |f| [f.arrival_airport.code, f.arrival_airport.id]}
    @aflights = a_flight_options.uniq
    @dates = Flight.all.map{ |f| [f.start] }
    # set search_flights to nil initially
    @search_flights = nil
    
    if search_submitted
      departure_airport = params[:departure_airport]
      arrival_airport = params[:arrival_airport]
      @passengers = params[:passengers]
      start = Date.parse(params[:dates])
      @search_flights = Flight.where(departure_airport_id: departure_airport, arrival_airport_id: arrival_airport, start: start.all_day)
    end 
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)
  
    respond_to do |format|
      if @flight.save
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy!

    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      # params.fetch(:flight, {})
      params.require(:flight).permit(bookings_attributes: [ :_destroy])
    end

    def search_submitted
      params[:departure_airport] && params[:arrival_airport] && Date.parse(params[:dates])
    end
end