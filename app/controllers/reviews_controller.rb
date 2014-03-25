class ReviewsController < ApplicationController

  def new
    @user = User.find(params[:for_user_id])
    @review = @user.reviews.build
  end

  def create
    @user = User.find(params[:for_user_id])
    @review = @user.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @user, notice: "Review created successfully"
    else
      render :new
    end
  end

  protected

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end

end
