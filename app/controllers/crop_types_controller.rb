class CropTypesController < ApplicationController
  def new
    @year = Year.find(params[:year_id])
    @crop_type = CropType.new
  end

  def create
    @year = Year.find(params[:year_id])
    @crop_type = @year.crop_types.create(crop_type_params)
    if @crop_type.save
      redirect_to year_path(@year)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def crop_type_params
    params.require(:crop_type).permit(:name)
  end
end
