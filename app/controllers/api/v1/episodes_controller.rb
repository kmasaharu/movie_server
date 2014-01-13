class Api::V1::EpisodesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @episodes = Rails.cache.read(request.url)
    if @episodes.nil?
      if param_times.nil?
        @episodes = Episode.find(:all, :include => [:title])
      else
        @episodes = Episode.find(:all, :conditions => ["updated_at >= '#{param_times}'"], :include => [:title])
      end
      Rails.cache.write(request.url, @episodes, expires_in: 10.minutes)  # 10分で消える。
    end
  end
  
  def show
    @titles = Rails.cache.read(request.url + 'title' + params[:id].to_s);
    if @titles.nil?
      @titles   = Title.find(params[:id])
      Rails.cache.write(request.url + 'title' + params[:id].to_s, @titles, expires_in: 10.minutes)  # 10分で消える。
    end
    
    @episodes = Rails.cache.read(request.url);
    if @episodes.nil?
      if param_times.nil?
        @episodes = Episode.find(:all, :conditions => {:title_id => params[:id]})
      else
        @episodes = Episode.find(:all, :conditions => ["updated_at >= '#{param_times}' and title_id = #{params[:id]}"])
      end
      Rails.cache.write(request.url, @episodes, expires_in: 10.minutes)  # 10分で消える。
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