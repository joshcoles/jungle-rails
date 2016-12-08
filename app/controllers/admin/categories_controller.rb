class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(name: :desc).all
  end

  def create
    @category = Category.new
  end

  def show
  end

end
