class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:update, :destroy]
  def index
  end

  def new
  end

  def create
    @user = User.new(reg_helper)
    if @user.save
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      flash[:errors] = @user.errors.full_messages
      # redirect_to new_sessions_path
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
    
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    puts params
    @user = User.find(current_user.id)
    puts "In user Update controller"
    puts "@user", @user
    puts "edit_helper ", edit_helper
    @user.update(edit_helper)
    # @user.first_name = edit_helper[:first_name]
    # @user.last_name = edit_helper[:last_name]
    # @user.city = edit_helper[:city]
    # @user.state = edit_helper[:state]
    # @user.email = edit_helper[:email]
    if @user.save
       redirect_to events_path
        # redirect_to '/events'
    else
        flash[:errors] = @user.errors.full_messages
        redirect_to edit_user_path(current_user.id)
        # redirect_to "/users/<% current_user.id %>/edit"
    end
  end

  def delete
  end

  private
    def reg_helper
      params.require(:reg).permit(:name, :alias, :email, :password) if params[:reg].present?
    end

    def edit_helper
      puts params
      params.require(:up).permit(:name,:alias,:email) if params[:up].present?
    end
    def check_user
      unless current_user.id.to_s == params[:id]
          redirect_to events_path
      end
    end
end

