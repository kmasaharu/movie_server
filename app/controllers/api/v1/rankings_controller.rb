class Api::V1::RankingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      @rankings = Ranking.find(:all, :order => :count, :limit => 50)
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