module Service
  module Products
    class Update < Service::Base
      attr_reader :product, :attribute

      def initialize(product, attribute)
        @product = product
        @attribute = attribute
      end

      def call
        ActiveRecord::Base.transaction do
          product.lock!

          product.name = attribute[:name] if attribute[:name].present?
          product.price = attribute[:price].to_i if attribute[:price].present?
          product.description = attribute[:description] if attribute[:description].present?
          product.active = attribute[:active] if attribute[:active].present?
          product.stock = attribute[:stock].to_i if attribute[:stock].present?
          product.save!
        end

        product
      end
    end
  end
end