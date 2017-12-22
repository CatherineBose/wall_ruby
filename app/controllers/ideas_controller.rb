class IdeasController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @messages = Idea.includes(:user)
    @messages_all = Idea.all
  end

  def new
  end

  def create
    @user = User.find(session[:user_id])
    @idea = @user.ideas.new(message_params)
    puts "in ideas create controller for idea creation"
    if @idea.save
      puts "idea successfully saved"
      redirect_to "/ideas"
    else
      puts "Idea could not be created because of errors"
      flash[:errors] = @idea.errors.full_messages
      redirect_to "/ideas"
    end
  
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end
end

private
    def message_params
      params.require(:message).permit(:content) if params[:message].present?
    end