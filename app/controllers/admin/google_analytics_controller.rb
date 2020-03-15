class Admin::GoogleAnalyticsController < Admin::BaseAdminController
  load_and_authorize_resource
  skip_load_resource only: %i[index]
  before_action :set_shops, only: %i[new edit]

  def new; end

  def show; end

  def create
    if params[:fbp_radio] == 'one_store'
      if @google_analytic.save
        flash[:notice] = 'Google Analytic has been added for your store'
        redirect_to admin_google_analytics_path
      else
        render 'new'
      end
    else
      @google_analytic.general = true
      if @google_analytic.save
        flash[:notice] = 'Google Analytic has been added for all of your stores'
        redirect_to admin_google_analytics_path
      else
        render 'new'
      end
    end
  end

  def edit; end

  def update
    if params[:fbp_radio] == 'one_store'
      @google_analytic.general = false
      if @google_analytic.update(google_analytic_params)
        flash[:notice] = 'Google Analytic has been updated'
        redirect_to admin_google_analytics_path
      else
        render 'new'
      end
    elsif params[:fbp_radio] == 'all_stores'
      @google_analytic.general = true
      @google_analytic.shop_id = nil
      if @google_analytic.update(google_analytic_params)
        flash[:notice] = 'Google Analytic has been set for all of your stores'
        redirect_to admin_google_analytics_path
      else
        render 'new'
      end
    elsif params[:fbp_radio] == 'same_store'
      if @google_analytic.update(google_analytic_params)
        flash[:notice] = 'Google Analytic has been updated'
        redirect_to admin_google_analytics_path
      else
        render 'new'
      end
    end
  end

  def index
    if current_admin
      @google_analytics = GoogleAnalytic.all
      @general_analytic = 'true'
    else
      @google_analytic = GoogleAnalytic.where(employee_user: current_employee_user, general: true)
      if @google_analytic.any?
        @google_analytics = @google_analytic
        @general_analytic = 'true'
      else
        @google_analytics = GoogleAnalytic.where(employee_user: current_employee_user)
        @general_analytic = 'false'
      end
    end
  end

  def destroy
    return unless @google_analytic.destroy
    flash[:notice] = 'Google Analytic was removed'
    redirect_to admin_google_analytics_path
  end

  private

  def google_analytic_params
    if params[:fbp_radio] == 'one_store'
      params.require(:google_analytic).permit(:tracking_id, :shop_id, :employee_user_id)
    elsif params[:fbp_radio] == 'all_stores'
      params.require(:google_analytic).permit(:tracking_id, :employee_user_id)
    elsif params[:fbp_radio] == 'same_store'
      params.require(:google_analytic).permit(:tracking_id)
    end
  end

  def set_shops
    existing_shops_analytics = GoogleAnalytic.where(employee_user: current_employee_user).pluck(:shop_id)
    @shops = []
    manager_or_employee_brands.each do |brand|
      brand.shops.reorder(brand_id: :desc).order(id: :asc).each do |shop|
        @shops << shop unless existing_shops_analytics.include?(shop.id)
      end
    end
  end
end
