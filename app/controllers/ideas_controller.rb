class IdeasController < ApplicationController

  navigation :ideas
  sidebar
  uses_tiny_mce :only => [:new, :create, :edit, :update]

  before_filter :load_idea, :only => [:show, :edit, :update, :destroy, :publish, :sticky]
  before_filter :load_tags, :only => [:new, :create, :edit, :update]

  access_control do
    default :deny

    allow logged_in, :of => :idea
  end

  def index
    @ideas = Idea.for_user(current_user).all(:order => "sticky DESC, created_at DESC").paginate :page => params[:page], :per_page => 10
  end

  def show
    @features = @idea.features
  end

  def new
    @idea = Idea.new
  end

  def create
    tags = params[:idea].delete(:tag_list)

    @idea = Idea.new(params[:idea])
    @idea.user = current_user
    if @idea.save
      current_user.tag(@idea, :with => tags, :on => :tags)
      redirect_to ideas_path
    else
      @idea.tag_list = tags
      render :action => "new"
    end
  end  

  def edit
    @idea.tag_list = @idea.tags_from(current_user)
  end

  def update
    tags = params[:idea].delete(:tag_list)

    if @idea.update_attributes(params[:idea])
      current_user.tag(@idea, :with => tags, :on => :tags)
      redirect_to ideas_path
    else
      @idea.tag_list = tags
      render :action => "edit"
    end
  end

  def destroy
    @idea.destroy

    redirect_to ideas_path
  end

  def publish
    @idea.public = params[:publish]
    @idea.save

    render :partial => "publish_menu_item", :layout => false
  end

  def sticky
    @idea.sticky = params[:sticky]
    @idea.save

    render :partial => "sticky_menu_item", :layout => false
  end

  def tag
    @ideas = Idea.tagged_with(params[:tag]).paginate :page => params[:page], :per_page => 10
  end

private

  def load_idea
    @idea = Idea.for_user(current_user).find(params[:id])
  end

  def load_tags
    @tags = current_user.owned_tags.collect { |tag| tag.name }
  end
  
end
