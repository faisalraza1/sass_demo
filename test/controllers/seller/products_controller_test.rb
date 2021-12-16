require 'test_helper'

class Seller::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_products_index_url
    assert_response :success
  end

end
