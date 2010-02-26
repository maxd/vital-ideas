class Settings::TagsController < Settings::Application

  navigation :settings

  before_filter :load_tag, :only => [:edit, :update, :destroy]

  def index
    @tags = current_user.owned_tags.paginate(:page => params[:page], :per_page => 10)    
  end

  def edit
  end

  def update
    @tag.name = params[:tag][:name]
    @tag.foreground_color = params[:tag][:foreground_color]
    @tag.background_color = params[:tag][:background_color]
    if @tag.save
      redirect_to settings_tags_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @tag.destroy

    redirect_to settings_tags_path
  end

private

  def load_tag
    @tag = current_user.owned_tags.select { |tag| tag.id == params[:id].to_i }.first
  end

end
