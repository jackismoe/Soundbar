class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
    @category = Category.all
  end
  
  def create
      @category = Category.all
      @brand = Brand.create(brand_params)
      if @brand.save
        redirect_to brand_path(@brand)
      else
        render :new
      end
  end

  def show
    @brand = Brand.find(params[:id])
  end

  private

  def brand_params
      params.require(:brand).permit(:name, :category_id)
  end
end