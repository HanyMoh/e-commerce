class Api::V2::Dashboard::EmployeeUsersController < Api::V2::Dashboard::ApiBaseController
  before_action :set_employee_user, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all employee_users for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all employee_users in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all employee_users of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/employee_users
  # GET /api/v2/dashboard/employee_users.json
  def index
    @employee_users = if current_manager
                        EmployeeUser.where(organization_id: current_manager.organization_id).newest_first.per_page(params[:page])
                      else
                        EmployeeUser.newest_first.per_page(params[:page])
                       end
  end

  swagger_api :show do
    summary 'Show a developer by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Developer ID'
    response :not_found
  end
  # GET /api/v2/dashboard/employee_users/1
  # GET /api/v2/dashboard/employee_users/1.json
  def show; end

  swagger_api :create do
    summary 'Create EmployeeUser'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'employee_user[name]', :string, :required, 'Employee User name'
    param :form, 'employee_user[avatar]', :string, :required, 'Employee User avatar'
    param :form, 'employee_user[email]', :string, :required, 'Employee User email'
    param :form, 'employee_user[type]', :string, :required, 'Employee User type'
    param :form, 'employee_user[following_standards]', :boolean, :required, 'Following standards'
    param :form, 'employee_user[job_title]', :string, :required, 'Job Title'
    param :form, 'employee_user[phone_number]', :string, :required, 'Phone Number'
    param :form, 'employee_user[created_by]', :integer, :required, 'Created By'
    param :form, 'employee_user[password]', :string, :required, 'Password'
    param :form, 'employee_user[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'employee_user[service_type]', :integer, :required, 'Service Type'
    param :form, 'employee_user[assigned_brand_ids]', :array, :required, 'Assigned brand IDs'
  end
  # POST /api/v2/dashboard/employee_users
  # POST /api/v2/dashboard/employee_users.json
  def create
    @employee_user = EmployeeUser.new(employee_user_params)
    render json: @employee_user.errors unless @employee_user.save
  end

  swagger_api :update do
    summary 'Update EmployeeUser'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'EmployeeUser ID'
    param :form, 'employee_user[name]', :string, :required, 'Employee User name'
    param :form, 'employee_user[avatar]', :string, :required, 'Employee User avatar'
    param :form, 'employee_user[email]', :string, :required, 'Employee User email'
    param :form, 'employee_user[type]', :string, :required, 'Employee User type'
    param :form, 'employee_user[following_standards]', :boolean, :required, 'Following standards'
    param :form, 'employee_user[job_title]', :string, :required, 'Job Title'
    param :form, 'employee_user[phone_number]', :string, :required, 'Phone Number'
    param :form, 'employee_user[created_by]', :integer, :required, 'Created By'
    param :form, 'employee_user[password]', :string, :required, 'Password'
    param :form, 'employee_user[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'employee_user[service_type]', :integer, :required, 'Service Type'
    param :form, 'employee_user[assigned_brand_ids]', :array, :required, 'Assigned brand IDs'
  end
  # PATCH/PUT /api/v2/dashboard/employee_users/1
  # PATCH/PUT /api/v2/dashboard/employee_users/1.json
  def update
    render json: @employee_user.errors unless @employee_user.update(employee_user_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing EmployeeUser'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'EmployeeUser Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/employee_users/1
  # DELETE /api/v2/dashboard/employee_users/1.json
  def destroy
    @employee_user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_user
    @employee_user = if current_manager
                       EmployeeUser.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                     else
                       EmployeeUser.find(params[:id])
                      end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_user_params
    params.require(:employee_user).permit(:name, :avatar, :email, :type, :following_standards,
                                          :job_title, :phone_number, :created_by, :authentication_token,
                                          :password, :password_confirmation, :organization_id,
                                          :service_type, assigned_brand_ids: [])
  end
end
