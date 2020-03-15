module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when 'success'
      'alert-success' # Green
    when 'error'
      'alert-danger' # Red
    when 'alert'
      'alert-warning' # Yellow
    when 'notice'
      'alert-info' # Blue
    else
      puts flash_type
    end
  end

  def toast_bootstrap_class_for(flash_type)
    case flash_type
      when 'success'
        "success" # Green
      when 'danger'
        "error" # Red
      when 'warning'
        "warning" # Yellow
      when 'notice'
        "info" # Blue
      else
        puts flash_type
    end
  end

  def qr_image(source, size)
    image_tag(RQRCode::QRCode.new(source.to_s).as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: size,
      border_modules: 1,
      module_px_size: 6,
      file: nil
    ).to_data_url)
  end

  def image_exists?(model, attr_name)
    image = model.cover_image.url if attr_name == 'cover_image'

    if image != '/fallback/default.png'
      return true
    else
      return false
    end
  end

  def check_num_of_brands(current_user)
    return current_user.brands.count unless current_admin
    Brand.count
  end

  def brand_shops(brands)
    Shop.where(brand: brands).all
  end

  def check_exist_of_model(current_user, model)
    unless current_admin
      if model == Brand
        check_num_of_brands(current_user) == 0
      else
        model.joins(:brand).where(brand: current_user.brands).count == 0
      end
    end
  end

  def any_organization_exists?
    return true if Organization.any?
    false
  end

  def any_category_exists?
    return true if Category.any?
    false
  end

  def any_building_exists?
    return true if Mall.any?
    false
  end

  def any_manager_exists?
    return true if OrganizationManager.any?
    false
  end

  def any_shop_exists?
    return true if current_admin && Shop.any?
    return true if current_admin || Shop.where(organization_id: current_active_user.organization_id).any?
  end

  def paginate_products(products)
    @products = products.per_page(params[:page])
  end
end
