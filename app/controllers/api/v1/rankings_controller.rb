class Api::V1::RankingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @rankings = Rails.cache.read(request.url)
    if @rankings.nil?
      @rankings = Ranking.find(:all, :order => :count, :limit => 50)
      Rails.cache.write(request.url, @rankings, expires_in: 10.minutes)  # 10分で消える。
    end
  end
  
  def update
    @rankings = Ranking.find(params[:id])
    @rankings.increment(:count)
    if @rankings.save 
      head :ok
    else
      render json: @rankings.errors.full_message, status: :unprocessable_entity
    end
  end
end