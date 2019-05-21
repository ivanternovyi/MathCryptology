class DecryptCeaserController < ApplicationController
  def index
    @show = params[:show]
  end

  def compute
    @decrypted = DecryptCeaserService.new(ceaser_params[:body]).call
    Result.create(before: ceaser_params[:body], after: @decrypted)
    redirect_to action: 'index', show: true
  end

  private

  def ceaser_params
    params.permit(:body)
  end
end
