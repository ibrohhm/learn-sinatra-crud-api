module Service
  module Products
    class Create < Service::Base
      attr_reader :product, :attribute

      def initialize(product, attribute)
        @product = product
        @attribute = attribute
      end

      def call
        ActiveRecord::Base.transaction do
          product.lock!

          product.name = attribute[:name]
          product.price = attribute[:price].to_i
          product.description = attribute[:description]
          product.active = attribute[:active]
          product.stock = attribute[:stock].to_i
          product.save!
        end

        product
      end
    end
  end
end