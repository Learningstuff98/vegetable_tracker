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
    @crop_types = @year.crop_types.all
  end

  def edit
    @year = Year.find(params[:id])
  end

  def update
    @year = Year.find(params[:id])
    @year.update(year_params)
    if @year.save
      redirect_to year_path(@year)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @year = Year.find(params[:id])
    @year.destroy
    redirect_to root_path
  end

  private

  def year_params
    params.require(:year).permit(:year_number)
  end
end
