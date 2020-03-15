# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :set_brand_and_shop, only: %i[new destroy]
  # before_action :set_url, only: %i[new destroy]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
    # redirect_to @navbox_url
  end

  private

  def set_brand_and_shop
    @brand = Brand.find(cookies[:navbox_brand])
    @shop = Shop.find(cookies[:navbox_shop])
  end

  def set_url
    @navbox_url = request.base_url + '/store/' + (@shop.building ? @shop.building.area.parameterize : @shop.street.parameterize) + '/' + @brand.name.parameterize + '/' + @shop.id.to_s
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
