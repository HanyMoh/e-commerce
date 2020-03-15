class Api::V2::Cashier::RegistrationsController < Api::V2::Cashier::ApiBaseController
  before_action :set_employee_user, only: %i[update destroy]

  swagger_controller :Registerations, 'Registerations'

  swagger_api :create do
    summary 'sign up'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'employee_user[email]', :email, :required, 'User Email'
    param :form, 'employee_user[name]', :name, :required, 'User Name'
    param :form, 'employee_user[password]', :password, :required, 'User password'
    param :form, 'employee_user[password_confirmation]', :password, :required, 'Confirm password'
    param :form, 'employee_user[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'employee_user[organization_manager_id]', :integer, :required, 'Organization Manager ID'
    param :form, 'employee_user[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'employee_user[avatar]', :avatar, :optional, 'User Avatar'
    param :form, 'employee_user[power][][product_redeem]', :boolean, :optional, 'Product Redeem (True or False)'
    param :form, 'employee_user[power][][money_redeem]', :boolean, :optional, 'Money Redeem (True or False)'
    param :form, 'employee_user[power][][navbox_scan]', :boolean, :optional, 'Navbox Scan (True or False)'
    param :form, 'employee_user[power][][clients_profile]', :boolean, :optional, 'Clients Profile (True or False)'
    param :form, 'employee_user[power][][branch_analytics]', :boolean, :optional, 'Branch Analytics (True or False)'
    param :form, 'employee_user[power][][branch_storage]', :boolean, :optional, 'Branch Storage (True or False)'
    param :form, 'employee_user[power][][create_campaign]', :boolean, :optional, 'Create Campaign (True or False)'
    param :form, 'employee_user[power][][home_delivery]', :boolean, :optional, 'Home Delivery (True or False)'
    param :form, 'employee_user[power][][organization_id]', :integer, :optional, 'Organization ID'
    response :not_acceptable
  end

  def create
    @employee_user = EmployeeUser.new(employee_user_params)
    avatar = params[:employee_user][:avatar]
    if avatar.blank? || avatar.try(:match, /^data:(.*?);(.*?),(.*)$/)
      unless @employee_user.save
        render json: { errors: @employee_user.errors }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Avatar should be Base64 encoded image' }, status: :unprocessable_entity
    end
  end

  def update
    render json: @employee_user.errors unless @employee_user.update(employee_user_params)
  end

  def destroy
    render json: { message: 'Employee User deleted successfully', status: :ok } if @employee_user.destroy
  end

  private

  def set_employee_user
    @employee_user = EmployeeUser.find(params[:id])
  end

  def employee_user_params
    params.require(:employee_user).permit(:id, :email, :shop_id, :organization_manager_id, :organization_id, :job_title, :phone_number, :name, :password, :password_confirmation,
                                          :avatar, power_attributes: %i[id money_redeem product_redeem navbox_scan clients_profile branch_analytics create_campaign branch_storage home_delivery organization_id])
  end
end
