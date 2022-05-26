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

  def show
    @crop_type = CropType.find(params[:id])
  end

  def edit
    @crop_type = CropType.find(params[:id])
  end

  def update
    @crop_type = CropType.find(params[:id])
    @crop_type.update(crop_type_params)
    if @crop_type.save
      redirect_to crop_type_path(@crop_type)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @crop_type = CropType.find(params[:id])
    @year = @crop_type.year
    @crop_type.destroy
    redirect_to year_path(@year)
  end

  private

  def crop_type_params
    params.require(:crop_type).permit(:name)
  end
end
