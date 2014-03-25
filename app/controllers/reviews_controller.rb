class ReviewsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @review = @user.reviews.build
  end

  def create
    @user = User.find(params[:user_id])
    @review = @user.reviews.build(review_params)
    @review.user_id = current_user.id
    @review.for_user_id = @user.id
    @review.author = current_user.username
    if @review.save
      redirect_to @user, notice: "Review created successfully"
    else
      render :new
    end
  end

  protected

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
