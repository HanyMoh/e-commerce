class Admin::OrganizationManagersController < Admin::BaseAdminController
  load_and_authorize_resource

  def new; end

  def create
    if @organization_manager.save
      respond_with(@organization_manager, location: admin_organization_managers_path(@organization_managers))
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @organization_manager.update(organization_manager_params)
      respond_with(@organization_manager, location: admin_organization_managers_path(@organization_managers))
    else
      render 'edit'
    end
  end

  def index; end

  def destroy
    (respond_with @organization_manager, location: admin_organization_managers_path) if @organization_manager.destroy
  end

  private

  def organization_manager_params
    params.require(:organization_manager).permit(:email, :password, :password_confirmation,
                                                 :name, :avatar, :job_title, :seo, :following_standards,
                                                 :service_type, :organization_id, :phone_number)
  end
end
