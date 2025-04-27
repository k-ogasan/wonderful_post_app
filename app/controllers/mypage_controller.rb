class MypageController < ApplicationController
  before_action :authenticate_user!
  def show
    articles = current_user.articles
    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @articles = articles.page params[:page]
    # @articles = current_user.articles.page(params[:page]).per(10)
  end
end
