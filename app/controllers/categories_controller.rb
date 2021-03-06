class CategoriesController < ApplicationController

  respond_to :html, :xml, :json

  def index
    @categories = Category.all
    respond_with @categories
  end

  def show
    @category = Category.find(params[:id])
    respond_with @category
  end

  def new
    @category = Category.new
    respond_with @category
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    respond_with @category, :location => categories_path
  end

  def update
    @category = Category.find(params[:id]) if @category.update_attributes(params[:category])
    respond_with @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with @category
  end
end
