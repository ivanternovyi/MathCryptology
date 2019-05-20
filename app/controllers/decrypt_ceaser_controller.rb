class DecryptCeaserController < ApplicationController
  def index
    @decrypted = params[:decrypted]
    @text = params[:text]
  end

  def compute
    @decrypted = DecryptCeaserService.new(ceaser_params[:body]).call
    redirect_to action: 'index',
                decrypted: @decrypted,
                text: ceaser_params[:body]
  end

  private

  def ceaser_params
    params.permit(:body)
  end
end
