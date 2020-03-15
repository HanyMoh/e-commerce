require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_manager, :current_employee,
                :current_employee_user_not_manager,
                :manager_or_employee_brands,
                :current_active_user
  before_action :set_cache_headers
  before_action :allow_iframe
  before_action :set_raven_context
  before_action :set_headers

  def current_active_user
    current_admin || current_organization_manager || current_employee_user || current_user
  end

  def index
    render 'layouts/comming_soon', layout: 'application'
  end

  def current_organization
    current_organization_manager.try(:organization) || current_employee_user.try(:organization)
  end

  def current_ability
    @current_ability ||= if /\/admin/.match?(request.fullpath)
                           Ability.new(current_admin || current_organization_manager || current_employee_user)
                         else
                           Ability.new(current_user)
                         end
  end

  # def manager_or_employee_brands
  #   return current_employee_user.brands if current_employee_user.class.name == 'Manager'
  #   return current_employee_user.assigned_brands if current_employee_user.class.name == 'EmployeeUser'
  #   Brand.all
  # end

  def check_user_brands(target, brand)
    brands = target.pluck(:id)
    if brands.include?(brand.to_i)
      @brand = Brand.find(brand)
    else
      flash[:error] = 'You may only change themes of your own brands'
      redirect_to admin_brands_path
    end
  end

  def check_exist_of_brands(current_user)
    current_user.brands.count.zero?
  end

  def brand_shops(brands)
    Shop.where(brand: brands).all
  end

  def brand_shop360s(brands)
    shop360s = []
    brand_shops(brands).each do |shop|
      shop360s << shop.shop360
    end
    shop360s
  end

  def check_user_shops(target, shop)
    shops = []

    target.each do |brand|
      brand.shops.each do |shop|
        shops << shop.id
      end
    end

    if shops.include?(shop.to_i)
      @shop = Shop.find(shop)
    else
      flash[:error] = 'You may only change themes of your own shops'
      redirect_to admin_shops_path
    end
  end

  def set_user_shops(target)
    @shops = []
    target.each do |brand|
      brand.shops.each do |shop|
        @shops << shop
      end
    end
    @shops
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :organization_manager
      new_organization_manager_session_path
    when :employee_user
      new_employee_user_session_path
    when :user
      root_path
      cookies[:navbox_url]
    end
  end

  def after_sign_in_path_for(user)
    case user
    when current_admin
      stored_location_for(user) || admin_path
    when current_organization_manager
      # intro_form_admin_brands_path ifi new_manager?
      admin_path
    when current_employee_user
      admin_path
    when current_user
      root_path
    end
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id],
                       user: (current_user&.user_name)) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

  def new_manager?
    current_organization_manager.brands.count.zero?
  end

  def set_headers
    request.headers['Access-Control-Allow-Origin'] = '*'
    request.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    request.headers['Access-Control-Request-Method'] = '*'
    request.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
