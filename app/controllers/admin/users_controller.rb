class Admin::UsersController < Admin::Application

  navigation :users
  sidebar

  def index
    @users = User.all(:order => "login ASC").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_users_path
    else
      render :action => "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_users_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @idea = User.find(params[:id])
    @idea.destroy if @idea.login != "admin"

    redirect_to admin_users_path
  end

end
