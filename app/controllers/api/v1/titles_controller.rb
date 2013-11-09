class Api::V1::TitlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @titles = Title.all
    #@posts = Post.User.all
  end
end