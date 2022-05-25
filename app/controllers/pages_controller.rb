class PagesController < ApplicationController
  def home
    if current_user
      @years = current_user.search(params[:keyword])
    else
      @years = []
    end
  end
end
