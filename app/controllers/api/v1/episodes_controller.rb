class Api::V1::EpisodesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if param_times.nil?
      @episodes = Episode.find(:all, :include => [:title])
    else
      @episodes = Episode.find(:all, :conditions => ["updated_at >= '#{param_times}'"], :include => [:title])
    end
  end
  
  def show
    @titles   = Title.find(params[:id])
    if param_times.nil?
      @episodes = Episode.find(:all, :conditions => {:title_id => params[:id]})
    else
      @episodes = Episode.find(:all, :conditions => ["updated_at >= '#{param_times}' and title_id = #{params[:id]}"], :include => [:title])
    end
  end
  
  private 
  def param_times
    if params[:year].nil? or params[:month].nil? or params[:day].nil? 
      nil
    else
      Time.mktime(params[:year], params[:month], params[:day], 00, 00, 00)
    end
  end
end