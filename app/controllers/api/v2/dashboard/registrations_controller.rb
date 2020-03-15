class Api::V2::Dashboard::RegistrationsController < Api::V2::Dashboard::ApiBaseController
  skip_before_action :authenticate_user
  before_action :set_organization

  swagger_controller :Registerations, 'Dashboard'

  swagger_api :create do
    summary 'sign up'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'organization_manager[email]', :email, :required, 'Organization Manager Email'
    param :form, 'organization_manager[name]', :name, :required, 'Organization Manager Name'
    param :form, 'organization_manager[password]', :password, :required, 'Organization Manager password'
    param :form, 'organization_manager[password_confirmation]', :password, :required, 'Confirm password'
    param :form, 'organization_manager[avatar]', :avatar, :optional, 'Organization Manager Avatar'
    param :form, 'organization[name]', :avatar, :optional, 'Organization Name'
    response :not_acceptable
  end

  def create
    @organization_manager = OrganizationManager.new(organization_manager_params)
    @organization_manager.organization = @organization
    avatar = params[:organization_manager][:avatar]
    if avatar.blank? || avatar.try(:match, /^data:(.*?);(.*?),(.*)$/)
      unless @organization_manager.save
        render json: { errors: @organization_manager.errors }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Avatar should be Base64 encoded image' }, status: :unprocessable_entity
    end
  end
  swagger_api :forget_password do
    summary 'send email instructions for forget password '
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'organization_manager[email]', :email, :required, 'Organization Manager Email'
  end

  def forget_password
    @organization_manager = OrganizationManager.find_by(email: organization_manager_params[:email])
    if @organization_manager.present?
      @organization_manager.send_reset_password_instructions
      render json: { message: 'password reset instruction was sent to your mail ' }
    else
      render json: { message: 'This email not found' }, status: :not_found
    end
  end

  private

  def organization_manager_params
    params.require(:organization_manager).permit(:email, :name, :password, :password_confirmation,
                                                 :avatar, :job_title, :seo, :following_standards,
                                                 :tutorial, :service_type, :phone_number)
  end

  def set_organization
    # TODO: refactoring
    @organization = Organization.new(organization_params)
    render json: @organization.errors unless @organization.save!
  end

  def organization_params
    params.require(:organization).permit(:name, organization_plan_attributes: %i[country stores_count price])
  end
end
