class CeaserCipherController < ApplicationController
  def index
    @cipher = params[:cipher]
    @text = params[:text]
    @shift = params[:shift]
  end

  def compute
    @cipher = CeaserCipherService.new(ceaser_params[:body],
                                      ceaser_params[:lang],
                                      ceaser_params[:shift]
                                     ).call
    redirect_to action: 'index',
                cipher: @cipher,
                text: ceaser_params[:body],
                shift: ceaser_params[:shift]
  end

  private

  def ceaser_params
    params.permit(:body, :lang, :shift)
  end
end
