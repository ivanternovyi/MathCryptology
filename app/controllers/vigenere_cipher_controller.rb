class VigenereCipherController < ApplicationController
  def index
    @show = params[:show]
  end

  def compute
    @encrypted = VigenereCipherService.new(vigenere_params[:body]).call
    Result.create(before: vigenere_params[:body], after: @encrypted)
    redirect_to action: 'index', show: true
  end

  private

  def vigenere_params
    params.permit(:body)
  end
end
