class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
        # render login page
  end

  def create
    @user = User.find_by_email(login_helper[:email]).try(:authenticate, login_helper[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      flash[:errors] = ["Email and Password Combination not found!"]
      redirect_to '/'
    end
  end

  def destroy
      # Log User out
      # set session[:user_id] to null
      # redirect to login page
      reset_session
      redirect_to "/"
  end

  private
    def login_helper
      params.require(:login).permit(:email, :password) if params[:login].present?
    end
end

