class LikesController < ApplicationController
  def index
  end

  def new
  end

  def create
    puts "In likes_controller create method :: for liking a post"
    @idea = Idea.find(params[:id])
    @like= Like.new(user_id: current_user.id, idea_id: params[:id])
    if @like.save
      puts "like got saved"
    redirect_to ideas_path
    else
      puts "like errored out"
      flash[:errors] = @user.errors.full_messages
      # redirect_to new_sessions_path
      redirect_to ideas_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
