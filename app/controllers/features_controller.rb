class FeaturesController < ApplicationController

  navigation :ideas
  sidebar
  uses_tiny_mce :only => [:new, :create, :edit, :update]

  before_filter :load_idea

  access_control do
    default :deny

    allow logged_in
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(params[:feature])
    @feature.idea = @idea
    if @feature.save
      redirect_to idea_path(@idea)
    else
      render :action => "new"
    end
  end

  def edit
    @feature = @idea.features.find(params[:id])
  end

  def update
    @feature = @idea.features.find(params[:id])

    if @feature.update_attributes(params[:feature])
      redirect_to idea_path(@idea)
    else
      render :action => "edit"
    end
  end

  def destroy
    @feature = @idea.features.find(params[:id])
    @feature.destroy

    redirect_to idea_path(@idea)
  end

private

  def load_idea
    @idea = Idea.for_user(current_user).find(params[:idea_id])
  end

end
