require 'httparty'
require 'json'

class ProductApiService
  include HTTParty
  URL= 'https://fakestoreapi.com/products'

  def self.call
    response = HTTParty.get(URL)
    products = JSON.parse(response.body)

    Product.delete_all

    products.each do |product_data|
        Product.create(
            name: product_data['title'],
            price: product_data['price'],
            description: product_data['description'],
            category: product_data['category'],
            image: product_data['image'],
            rating: product_data.dig('rating', 'rate'),
            rating_count: product_data.dig('rating', 'count'),
        )
    end
  end
end