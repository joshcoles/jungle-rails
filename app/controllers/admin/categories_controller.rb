class Admin::CategoriesController < Admin::BaseController

 def index
    @categories = Category.order(name: :desc).all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Your category has been created."
    else
      render :new
    end

  end

  def new
    @category = Category.new
  end

  def show
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
