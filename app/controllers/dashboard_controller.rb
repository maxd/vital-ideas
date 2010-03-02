class DashboardController < ApplicationController

  navigation :dashboard
  sidebar :only => :dashboard

  access_control do
    allow anonymous, :to => [ :index, :welcome, :show_public_idea ]
    allow logged_in, :to => [ :index, :welcome, :dashboard, :show_public_idea ]
  end

  def index
    if current_user.present?
      redirect_to :action => "dashboard"
    else
      redirect_to :action => "welcome"
    end
  end

  def welcome
    @published_ideas = Idea.published_ideas(nil).paginate :page => params[:page], :per_page => 10
  end

  def dashboard
    @sticked_ideas = Idea.for_user(current_user).sticked_ideas
    @published_ideas = Idea.for_user(current_user).published_ideas
    @last_ideas = Idea.for_user(current_user).last_ideas
    @last_changed_ideas = Idea.for_user(current_user).last_changed_ideas
    @tags = Idea.tag_counts_on(:tags, :conditions => "taggings.tagger_type = '#{User.class_name}' AND taggings.tagger_id = '#{current_user.id}'", :order => "count DESC")
  end

  def show_public_idea
    @idea = Idea.published.find(params[:id])
    @features = @idea.features
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = t("access_denied")
    redirect_to root_url
  end

end
