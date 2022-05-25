class PagesController < ApplicationController
  def home
    @years = current_user.search(params[:keyword]) if current_user
  end
end
