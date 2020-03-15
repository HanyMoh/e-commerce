class Admin::DevelopersController < Admin::BaseAdminController
  load_and_authorize_resource

  def new; end

  def create
    @developer.password = Digest::MD5.hexdigest(params[:developer][:password])
    if @developer.save
      flash[:notice] = "#{@developer.name} has joined nasnav developers team"
      redirect_to admin_developers_path
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @developer.update(name: params[:developer][:name],
                         password: Digest::MD5.hexdigest(params[:developer][:password]))
      flash[:notice] = 'Developer info has been updated'
      redirect_to admin_developers_path
    else
      render 'edit'
    end
  end

  def index
    @developers = Developer.all.per_page(params[:page])
  end

  def destroy
    return unless @developer.destroy
    flash[:notice] = 'Developer is revoked'
    redirect_to admin_developers_path
  end

  private

  def developer_params
    params.require(:developer).permit(:name, :password)
  end
end
