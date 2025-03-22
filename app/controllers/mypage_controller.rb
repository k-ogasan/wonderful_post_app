class MypageController < ApplicationController
  before_action :authenticate_user!
  def show
    @articles = current_user.articles
  end
end
