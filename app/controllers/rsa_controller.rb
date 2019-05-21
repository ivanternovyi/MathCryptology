class RsaController < ApplicationController
  def index
    @show = params[:show]
  end

  def compute
    @rsa_data = RsaCipherService.new(rsa_params[:body]).call
    Result.create(before: rsa_params[:body], after: @rsa_data)
    redirect_to action: 'index', show: true
  end

  private

  def rsa_params
    params.permit(:body)
  end
end
