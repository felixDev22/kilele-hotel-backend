module Api
  module V1
    class ReservationsController < ApplicationController
      
      def create 
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
          render json: @reservation, status: :created
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      def show
        @reservation = Reservation.find(params[:id])
        render json: @reservation
      end

      def index
        @reservations = Reservation.all
        render json: @reservation
      end

      private

      def reservation_params
        params.require(:reservation).permit(:user_id, :first_name, :last_name, :address, :post_code, :city, :country, :telephone,  :email, :confirm_email)
      end
    
    end
  end
end