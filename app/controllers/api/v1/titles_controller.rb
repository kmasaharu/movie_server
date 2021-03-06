class Api::V1::TitlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @titles = Rails.cache.read(request.url)
    if @titles.nil?
      if param_times.nil?
        @titles = Title.all
      else
        @titles = Title.find(:all, :conditions => ["updated_at >= '#{param_times}'"])
      end
      Rails.cache.write(request.url, @titles, expires_in: 10.minutes)  # 10分で消える。
    end
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
  
  def show
    @titles = Rails.cache.read(request.url)
    if @titles.nil?
      @titles   = Title.find(params[:id])
      Rails.cache.write(request.url, @titles, expires_in: 10.minutes)  # 10分で消える。
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