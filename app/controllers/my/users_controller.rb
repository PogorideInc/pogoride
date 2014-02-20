
class My::UsersController < My::MyController

  before_filter :current_user, :if_not_user_redirect

  def show
    @user = User.where(id: params[:id]).first
  end

  def edit
    @user = User.where(id: params[:id]).first
  end

  def update
    @user = User.where(id: params[:id]).first

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :username, 
      :email, 
      :about_me, 
      :password, 
      :password_confirmation
      )
  end

end