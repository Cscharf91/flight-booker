class PassengerMailer < ApplicationMailer
    def thank_you_email
        @booking = params[:booking]
        @user = params[:passenger]
        @flight = params[:flight]
        #@url = bookings_path(params[:booking_id])
        mail(to: @user.email, subject: 'Thank you for booking your flight!')
    end
end
