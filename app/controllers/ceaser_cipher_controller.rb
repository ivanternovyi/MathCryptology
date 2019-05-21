class CeaserCipherController < ApplicationController
  def index
    @shift = params[:shift]
    @show = params[:show]
  end

  def compute
    @cipher = CeaserCipherService.new(ceaser_params[:body],
                                      ceaser_params[:lang],
                                      ceaser_params[:shift]
                                     ).call
    Result.create(before: ceaser_params[:body], after: @cipher)

    redirect_to action: 'index',
                shift: ceaser_params[:shift],
                show: true
  end

  private

  def ceaser_params
    params.permit(:body, :lang, :shift)
  end
end
