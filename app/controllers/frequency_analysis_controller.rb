class FrequencyAnalysisController < ApplicationController
  def index
    @frequency_analysis = params[:frequency_analysis]
  end

  def compute
    @frequency_analysis = FrequencyAnalysisService.new(body_param).call
    redirect_to action: 'index', frequency_analysis: @frequency_analysis
  end

  private

  def body_param
    frequency_param[:body]
  end

  def frequency_param
    params.permit(:body)
  end
end
