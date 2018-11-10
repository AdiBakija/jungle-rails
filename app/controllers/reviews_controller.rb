class ReviewsController < ApplicationController
  before_action :user_check
  def create
    #This is where we're building our relationships
    #Find the product by the product id passed in the parameters and build a review for that product
    #
    product = Product.find(params[:product_id])
    review = product.reviews.build(reviews_params)
    review.user = current_user

    #Another method of doing the same as the above.
    #review = Review.new(reviews_params)
    #review.product = Product.find(params[:product_id])
    #review.user = current_user

    if review.save
      redirect_to product, notice: 'Review created!'
    else
      redirect_to product, notice: "Couldn't create review."
    end
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to product_path(params[:product_id])
  end

  private
  #strong parameters method here
  def reviews_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  def user_check
    if !current_user
      redirect_to '/'
    end
  end
end
