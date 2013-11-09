class Api::V1::EpisodesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @episodes = Episode.find(:all, :include => [:title])
  end
  
  def show
    @titles   = Title.find(params[:id])
    @episodes = Episode.find(:all, :conditions => { :title_id => params[:id]})
  end
end