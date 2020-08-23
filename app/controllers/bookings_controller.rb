class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_id])
        @passengers_number = params[:passengers].to_i
        puts @passengers_number
        puts params
        @passengers_number.times{@booking.passengers.build}
    end

    def create
        @booking = Booking.new(booking_params)
        @flight = Flight.find(booking_params[:flight_id])
        if @booking.save
            @booking.passengers.each do |p|
                PassengerMailer.with(booking: @booking, passenger: p, flight: @flight).thank_you_email.deliver_now
            end
            redirect_to @booking
        else
            @flight = Flight.find(params[:booking][:flight_id])
            render 'new'
        end
    end

    def show
        @booking = Booking.find(params[:id])
        flight_id = @booking.flight_id
        puts flight_id
        @flight = Flight.find(flight_id)
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
