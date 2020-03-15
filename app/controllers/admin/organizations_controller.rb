class Admin::OrganizationsController < Admin::BaseAdminController
  load_and_authorize_resource

  def new; end

  def index
    redirect_to action: 'new' if organization_exists?
    @organizations = Organization.all.per_page(params[:page])
  end

  def show; end

  def edit; end

  def create
    if @organization.save
      flash[:notice] = 'Organization has been created'
      redirect_to admin_organizations_path
    else
      render 'new'
    end
  end

  def update
    if @organization.update(organization_params)
      flash[:notice] = 'Organization has been updated'
      redirect_to admin_organizations_path
    else
      render 'edit'
    end
  end

  def destroy
    return unless @organization.destroy
    flash[:notice] = 'Organization was deleted'
    redirect_to admin_organizations_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :type)
  end

  def organization_exists?
    Organization.all.count.zero? ? true : false
  end
end
