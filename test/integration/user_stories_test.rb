require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

test "buying a product" do
  LineItem.delete_all
  Order.delete_all
  ruby_book = products(:ruby)
  
  get "/"
  assert_response :sucess
  assert_template "index"
  
  xml_http_request :post, '/line_items', product_id: ruby_book.id
  assert_response :success
  
  cart = Cart.find(session[:cart_id])
  assert_equal 1, cart.line_items.size
  assert_equal ruby_book, cart.line_items[0].product
end
