class YearsController < ApplicationController
  before_action :authenticate_user!

  def new
    @year = Year.new
  end

  def create
    @year = current_user.years.create(year_params)
    if @year.save
      redirect_to year_path(@year)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @year = Year.find(params[:id])
  end

  private

  def year_params
    params.require(:year).permit(:year_number)
  end
end
