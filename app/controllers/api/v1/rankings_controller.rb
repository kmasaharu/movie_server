class Api::V1::RankingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      @rankings = Ranking.find(:all, :order => :count, :limit => 50)
  end
  
  def update
    @titles = Title.find(params[:id])
    @titles.increment(:favorite_count)
    if @titles.save 
      head :ok
    else
      render json: @titles.errors.full_message, status: :unprocessable_entity
    end
  end
end