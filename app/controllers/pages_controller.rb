class PagesController < ApplicationController
  def home
    if current_user
      @years = current_user.years
    else
      @years = []
    end
  end
end
