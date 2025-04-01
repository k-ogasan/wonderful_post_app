class MypageController < ApplicationController
  before_action :authenticate_user!
  def show
    @articles = current_user.articles.page(params[:page]).per(10)
  end
end
