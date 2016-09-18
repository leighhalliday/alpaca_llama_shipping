class ShipmentsController < ApplicationController
  def create
    shipment = Shipment.schedule(
      order_id: shipment_params[:order_id],
      address: shipment_params[:address],
      weight_kg: shipment_params[:weight_kg],
      service_level: shipment_params[:service_level]
    )
    if shipment.save
      render json: {
        shipment_id: shipment.id
      }
    else
      render json: {
        errors: shipment.errors.to_h
      }, status: 400
    end
  end

  private

  def shipment_params
    params.require(:shipment).permit(:order_id, :weight_kg, :service_level, address: [:postal_code])
  end
end
