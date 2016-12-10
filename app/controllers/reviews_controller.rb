class ReviewsController < ApplicationController

  def create
   @product = Product.find(params[:product_id])
   @review = @product.reviews.create(review_params)
   @review.user = current_user

   if @review.save
     puts "I saved"
     redirect_to product_path(@product)
   else
     puts "save failed"
     redirect_to '/'
   end
 end

 private
 def review_params
   params.require(:review).permit(:description, :rating)
 end

end