class Admin::RolesController < Admin::BaseAdminController
  load_and_authorize_resource

  def index; end

  def new; end

  def create
    if @role.save
      respond_with(@role, location: admin_role_path(@role))
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @role.update(role_params)
      respond_with(@role, location: admin_role_path(@role))
    else
      render 'edit'
    end
  end

  def destroy
    respond_with(@role, location: admin_roles_path) if @role.delete
  end

  private

  def role_params
    params.require(:role).permit(:name, permission_ids: [], employee_user_ids: [])
  end
end
