class Admin::EmployeeUsersController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :require_same_manager, only: %i[edit update destroy]

  def index
    !current_admin ? employees_for(current_manager) : employees_for(current_admin)
  end

  def new; end

  def show; end

  def edit; end

  def create
    if @employee_user.save
      respond_with(@employee_user, location: admin_employee_user_path(@employee_user))
    else
      render 'new'
    end
  end

  def update
    if @employee_user.update(employee_user_params)
      respond_with(@employee_user, location: admin_employee_user_path(@employee_user))
    else
      render 'edit'
    end
  end

  def destroy
    (respond_with @employee_user, location: admin_employee_users_path) if @employee_user.destroy
  end

  private

  def require_same_manager
    return if current_admin
    return unless EmployeeUser.find(params[:id]).created_by != current_manager.id
    redirect_to admin_employee_users_path
    flash[:notice] = 'You are not authorized to edit this employee'
  end

  def employee_user_params
    if params[:employee_user][:password].blank?
      params.require(:employee_user).permit(:name, :avatar, :email, :type, :following_standards,
                                            :job_title, :phone_number, :created_by,
                                            :service_type, assigned_brand_ids: [])
    else
      params.require(:employee_user).permit(:name, :avatar, :email, :type, :following_standards,
                                            :job_title, :phone_number, :created_by,
                                            :password, :password_confirmation, :organization_id,
                                            :service_type, assigned_brand_ids: [])
    end
  end

  def employees_for(current_user)
    @q = if current_admin
           EmployeeUser.newest_first.ransack(params[:q])
         else
           EmployeeUser.where(created_by: current_user.id).newest_first.ransack(params[:q])
         end
    @employee_users = @q.result(distinct: true).per_page(params[:page])
  end
end
