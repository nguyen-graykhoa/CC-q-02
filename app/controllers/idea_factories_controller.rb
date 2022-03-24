class IdeaFactoriesController < ApplicationController
  before_action :find_idea_factory, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:show, :index]  
  before_action :authorize_user!, only:[:edit, :update, :destroy]

  def index
    @idea_factories = IdeaFactory.order(created_at: :desc)
  end

  def new
    @idea_factory = IdeaFactory.new 
  end

  def create
    @idea_factory = IdeaFactory.new(idea_factory_params)
    @idea_factory.user = current_user
    if @idea_factory.save
      flash.notice = "Idea created successfully!"
      redirect_to idea_factory_path(@idea_factory.id)
    else
      render :new, status: 303
    end
  end

  def show    
    @reviews = @idea_factory.reviews
    @review = Review.new  
    @like = @idea_factory.likes.find_by(user: current_user)
  end

  def edit
  end

  def update
    if @idea_factory.update(idea_factory_params)
      redirect_to idea_factory_path(@idea_factory.id)
    else
      render :edit, status: 303
    end
  end

  def destroy
    @idea_factory.destroy
    redirect_to root_path
  end

  private
  def authorize_user!
    redirect_to root_path, alert: "Not authorized" unless can?(:crud, @idea_factory)
  end

  def find_idea_factory
    @idea_factory = IdeaFactory.find params[:id]
  end

  def idea_factory_params
    params.require(:idea_factory).permit(:title, :description)
  end  
end
