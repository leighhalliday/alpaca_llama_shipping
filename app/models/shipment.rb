class Shipment < ApplicationRecord
  DEFAULT_SHIPPER = 'purolator'.freeze

  validates :order_id, :postal_code, :weight_kg, :service_level, :shipper, :status,
    presence: true

  def self.schedule(order_id:, address:, weight_kg:, service_level:)
    new(
      order_id: order_id,
      postal_code: address[:postal_code],
      weight_kg: weight_kg,
      service_level: service_level,
      shipper: DEFAULT_SHIPPER,
      tracking_code: 'ABC123' # Faked
    )
  end
end
