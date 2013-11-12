class Api::V1::TitlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @titles = Title.all
    #@posts = Post.User.all
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
  
  private 
  def put_params
    #params.require(:post).permit(:title, :body, :user_id)
    params.require(:post).permit(:title, :favorite_count, :image_url)
  end
end