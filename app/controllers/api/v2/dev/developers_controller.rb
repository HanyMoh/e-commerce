class Api::V2::Dev::DevelopersController < Api::V2::Dev::ApiBaseController
  protect_from_forgery with: :null_session,
                       if: proc { |c| c.request.format == 'application/json' }
  skip_before_action :authenticate_admin
  before_action :check_password

  swagger_controller :developers, 'Developers'

  swagger_api :generate_sitemap do
    summary 'Generate Sitemap'
    notes <<-eos
      This let you generate links for<br/>
      <strong>(Fortune, AlImage) including it's shops and products</strong><br/>
      which exists on the server<br/>
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :query, :password, :string, :required, 'API Password'
  end

  def generate_sitemap
    organizations = [13, 11, 8]
    SitemapGenerator::Sitemap.public_path = 'public/uploads'
    SitemapGenerator::Sitemap.default_host = 'https://www.nasnav.com'

    SitemapGenerator::Sitemap.create do
      organizations.map do |organization_id|
        @organization = Organization.find(organization_id)
        # Organization home page -> /org_p_name
        add "/#{@organization.name.parameterize}", changefreq: 'daily', lastmod: @organization.updated_at

        @organization.shops.find_each do |shop|
          # Shop home page -> /org_name/stores/p_area/shop_p_name/shop_id
          add "/#{shop.organization.name.parameterize}/stores/#{shop.building ? shop.building.area.parameterize : shop.street.parameterize}/#{shop.name.parameterize}/#{shop.id}", changefreq: 'daily', lastmod: shop.updated_at

          # All organization products -> /org_p_name/products*
          add "/#{shop.organization.name.parameterize}/products"

          @organization.products.find_each do |product|
            # Product page -> /org_p_name/stores/p_area/shop_p_name/shop_id/products/product_p_name/product_id
            add "/#{product.organization.name.parameterize}/stores/#{shop.building ? shop.building.area.parameterize : shop.street.parameterize}/#{shop.name.parameterize}/#{shop.id}/products/#{product.name.parameterize}/#{product.id}", changefreq: 'daily', lastmod: product.updated_at
          end
        end
      end
    end

    render json: { status: 'sitemap generated successfully on www.nasnav.com/uploads/sitemap.xml.gz' }, status: :ok
  end

  swagger_api :generate_parameterized_attributes do
    summary 'Generate Parameterized Attributes'
    notes <<-eos
      This generate p_name for the following models<br/>
      <strong>Organization, Shop, Brand, Product, Mall, Area, Adressess</strong>
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :query, :password, :string, :required, 'API Password'
  end

  def generate_parameterized_attributes
    results = GenerateParameterizedAttrsJob.new.perform
    render json: results
  end

  swagger_api :brand_transfer do
    summary 'Transfer brand ownership'
    notes <<-eos
      <b>This is VERY SENSITIVE API, PROCEED WITH CAUTION</b>
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :query, :password, :string, :required, 'API Password'
    param :query, :brand_name, :string, :required, 'Brand Name'
    param :query, :organization_manager_id, :integer, :required, 'Manager ID'
  end

  def brand_transfer
    brand = Brand.where(name: params[:brand_name]).first
    organization_manager = OrganizationManager.find(params[:organization_manager_id])


    if !brand || !organization_manager
      render json: { message: 'Brand or organization_manager doesn\'t exist',
                     available_brands: Brand.pluck(:id, :name),
                     available_managers: OrganizationManager.pluck(:id, :email)}
    else
      brand.organization_manager_id = organization_manager.id
      if brand.save
        render json: { message: "Brand '#{brand.name}' is now under '#{organization_manager.email}' control" }
      else
        render json: brand.errors.full_messages
      end
    end
  end

  private

  def check_password
    # Temporarily untill we set it as ENV variable on production
    return if params[:password] == 'Nasnav@4848'
    render json: { error: 'wrong password' }, status: :unauthorized
  end
end
