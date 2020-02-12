class Api::V1::AddressController < ApplicationController
    def create 
        @address = Address.create(address_params)
        render json: @address
    end

    def update 
        @address = Address.find_by(id: params[:id])
        @address.update(address_params)
        render json: @address
    end

    def destroy 
        @address = Address.find_by(id: params[:id])
        @address.destroy
        render json: @address
    end


    private

    def address_params
        params.require(:address).permit(:name, :address_1, :address_2, :city, :state, :zip, :user_id)
    end
end
