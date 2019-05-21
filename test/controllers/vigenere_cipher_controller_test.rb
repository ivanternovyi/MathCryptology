require 'test_helper'

class VigenereCipherControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vigenere_cipher_index_url
    assert_response :success
  end

  test "should get compute" do
    get vigenere_cipher_compute_url
    assert_response :success
  end

end
