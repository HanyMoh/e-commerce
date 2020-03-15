class Api::V2::Dashboard::CampaignsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_campaign, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all campaigns for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all campaigns in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all campaigns of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/campaigns
  # GET /api/v2/dashboard/campaigns.json
  def index
    @campaigns = if current_manager
                   Campaign.where(organization_id: current_manager.organization_id).newest_first.per_page(params[:page])
                 else
                   Campaign.newest_first.per_page(params[:page])
                 end
  end

  swagger_api :show do
    summary 'Show a campaign by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Campaign ID'
    response :not_found
  end
  # GET /api/v2/dashboard/campaigns/1
  # GET /api/v2/dashboard/campaigns/1.json
  def show; end

  swagger_api :create do
    summary 'Save Campaign'
    param :header, 'X-APP-TOKEN', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :form, 'campaign[name]', :string, :required, 'Campaign Name'
    param :form, 'campaign[description]', :string, :required, 'Campaign Description'
    param :form, 'campaign[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'campaign[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'campaign[beacons]', :array, :required, 'Beacons IDs ex [1] or [1,2]'
    param :form, 'campaign[start_time]', :string, :optional, 'Date format: year-month-day'
    param :form, 'campaign[end_time]', :string, :optional, 'Date format: year-month-day'
    param :form, 'campaign[enabled]', :string, :optional, 'Enable Campaign'
    param :form, 'campaign[header_type]', :integer, :optional, 'round_shape or rectangular_shape'
    param :form, 'campaign[header_txt]', :integer, :optional, 'Header Text'
    param :form, 'campaign[header_color]', :string, :optional, 'Header Color'
    param :form, 'campaign[header_txt_type]', :string, :optional, 'Header Text type'
    param :form, 'campaign[header_txt_color]', :string, :optional, 'Header Text Color'
    param :form, 'campaign[product_name]', :string, :optional, 'Product Name'
    param :form, 'campaign[product_type]', :integer, :optional, 'one or two or three'
    param :form, 'campaign[product_img]', :string, :optional, 'Product Image'
    param :form, 'campaign[product_price]', :float, :optional, 'Product Price'
    param :form, 'campaign[product_txt_type]', :string, :optional, 'Product Text Type'
    param :form, 'campaign[product_txt_color]', :string, :optional, 'Product Text Color'
    param :form, 'campaign[product_price_txt_type]', :string, :optional, 'Product Price Text Type'
    param :form, 'campaign[product_price_txt_color]', :string, :optional, 'Product Price Text Color'
    param :form, 'campaign[product_circle_color]', :string, :optional, 'Product Circle Color'
    param :form, 'campaign[bg_type]', :string, :optional, 'Background Type [ color or gradient or image ]'
    param :form, 'campaign[bg_image]', :string, :optional, 'Background Image'
    param :form, 'campaign[bg_color]', :string, :optional, 'Background Color'
    param :form, 'campaign[bg_left_color]', :string, :optional, 'Background Left Color (Gradient)'
    param :form, 'campaign[bg_right_color]', :string, :optional, 'Background Right Color (Gradient)'
    param :form, 'campaign[timeframe_attributes[start_time]]', :string, :optional, 'Start Time (Time Frame)'
    param :form, 'campaign[timeframe_attributes[end_time]]', :string, :optional, 'End Time (Time Frame)'
    param :form, 'campaign[timeframe_attributes[days]]', :string, :optional, 'Days (all or weekdays or weekends)'
    param :form, 'campaign[contents_attributes][][text]', :string, :optional, 'Content Text'
    param :form, 'campaign[contents_attributes][][text_color]', :string, :optional, 'Content Text Color'
    param :form, 'campaign[contents_attributes][][text_type]', :string, :optional, 'Content Text Type'
    param :form, 'campaign[buttons_attributes][][bg_type]', :string, :optional, 'call_phone or send_email or open_map or play_sound or play_video or open_url or open_page'
    param :form, 'campaign[buttons_attributes][][btn_color]', :string, :optional, 'Button Color'
    param :form, 'campaign[buttons_attributes][][youtube_link]', :string, :optional, 'Youtube Link'
    param :form, 'campaign[buttons_attributes][][text]', :string, :optional, 'Button Text'
    param :form, 'campaign[buttons_attributes][][text_color]', :string, :optional, 'Button Text Color'
    param :form, 'campaign[campaign_social_profile_attributes][][name]', :string, :optional, 'Button Text Color'
    param :form, 'campaign[campaign_social_profile_attributes][][gender]', :string, :optional, 'Button Text Color'
    param :form, 'campaign[campaign_social_profile_attributes][][min]', :string, :optional, 'Button Text Color'
    param :form, 'campaign[campaign_social_profile_attributes][][max]', :string, :optional, 'Button Text Color'
    response :unauthorized
    response :not_acceptable
    response :created
  end
  # POST /api/v2/dashboard/campaigns
  # POST /api/v2/dashboard/campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.beacons = params[:beacons]
    render json: @campaign.errors unless @campaign.save
  end

  swagger_api :update do
    summary 'update Campaign'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Campaign ID'
    param :form, 'campaign[name]', :string, :required, 'Campaign Name'
    param :form, 'campaign[description]', :string, :required, 'Campaign Description'
    param :form, 'campaign[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'campaign[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'campaign[beacons]', :array, :required, 'Beacons IDs ex [1] or [1,2]'
    param :form, 'campaign[start_time]', :string, :optional, 'Date format: year-month-day'
    param :form, 'campaign[end_time]', :string, :optional, 'Date format: year-month-day'
    param :form, 'campaign[enabled]', :string, :optional, 'Enable Campaign'
    param :form, 'campaign[header_type]', :integer, :optional, 'round_shape or rectangular_shape'
    param :form, 'campaign[header_txt]', :integer, :optional, 'Header Text'
    param :form, 'campaign[header_color]', :string, :optional, 'Header Color'
    param :form, 'campaign[header_txt_type]', :string, :optional, 'Header Text type'
    param :form, 'campaign[header_txt_color]', :string, :optional, 'Header Text Color'
    param :form, 'campaign[product_name]', :string, :optional, 'Product Name'
    param :form, 'campaign[product_type]', :integer, :optional, 'one or two or three'
    param :form, 'campaign[product_img]', :string, :optional, 'Product Image'
    param :form, 'campaign[product_price]', :float, :optional, 'Product Price'
    param :form, 'campaign[product_txt_type]', :string, :optional, 'Product Text Type'
    param :form, 'campaign[product_txt_color]', :string, :optional, 'Product Text Color'
    param :form, 'campaign[product_price_txt_type]', :string, :optional, 'Product Price Text Type'
    param :form, 'campaign[product_price_txt_color]', :string, :optional, 'Product Price Text Color'
    param :form, 'campaign[product_circle_color]', :string, :optional, 'Product Circle Color'
    param :form, 'campaign[bg_type]', :string, :optional, 'Background Type [ color or gradient or image ]'
    param :form, 'campaign[bg_image]', :string, :optional, 'Background Image'
    param :form, 'campaign[bg_color]', :string, :optional, 'Background Color'
    param :form, 'campaign[bg_left_color]', :string, :optional, 'Background Left Color (Gradient)'
    param :form, 'campaign[bg_right_color]', :string, :optional, 'Background Right Color (Gradient)'
    param :form, 'campaign[timeframe_attributes[id]]', :integer, :optional, 'Start Time (ID)'
    param :form, 'campaign[timeframe_attributes[start_time]]', :string, :optional, 'Start Time (Time Frame)'
    param :form, 'campaign[timeframe_attributes[start_time]]', :string, :optional, 'Start Time (Time Frame)'
    param :form, 'campaign[timeframe_attributes[end_time]]', :string, :optional, 'End Time (Time Frame)'
    param :form, 'campaign[timeframe_attributes[days]]', :string, :optional, 'Days (all or weekdays or weekends)'
    param :form, 'campaign[contents_attributes][][id]', :integer, :optional, 'Content ID'
    param :form, 'campaign[contents_attributes][][text]', :string, :optional, 'Content Text'
    param :form, 'campaign[contents_attributes][][text_color]', :string, :optional, 'Content Text Color'
    param :form, 'campaign[contents_attributes][][text_type]', :string, :optional, 'Content Text Type'
    param :form, 'campaign[buttons_attributes][][id]', :integer, :optional, 'Button ID'
    param :form, 'campaign[buttons_attributes][][bg_type]', :string, :optional, 'call_phone or send_email or open_map or play_sound or play_video or open_url or open_page'
    param :form, 'campaign[buttons_attributes][][btn_color]', :string, :optional, 'Button Color'
    param :form, 'campaign[buttons_attributes][][youtube_link]', :string, :optional, 'Youtube Link'
    param :form, 'campaign[buttons_attributes][][text]', :string, :optional, 'Button Text'
    param :form, 'campaign[buttons_attributes][][text_color]', :string, :optional, 'Button Text Color'
    param :form, 'campaign[campaign_social_profile_attributes][][id]', :integer, :optional, 'Social profile ID'
    param :form, 'campaign[campaign_social_profile_attributes][][name]', :string, :optional, 'Button Text Color'
    param :form, 'campaign[campaign_social_profile_attributes][][gender]', :string, :optional, 'Button Text Color'
    param :form, 'campaign[campaign_social_profile_attributes][][min]', :string, :optional, 'Button Text Color'
    param :form, 'campaign[campaign_social_profile_attributes][][max]', :string, :optional, 'Button Text Color'
  end
  # PATCH/PUT /api/v2/dashboard/campaigns/1
  # PATCH/PUT /api/v2/dashboard/campaigns/1.json
  def update
    render json: @campaign.errors unless @campaign.update(campaign_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Campaign'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Campaign Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/campaigns/1
  # DELETE /api/v2/dashboard/campaigns/1.json
  def destroy
    @campaign.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = if current_manager
                  Campaign.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                else
                  Campaign.find(params[:id])
                end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def campaign_params
    params.require(:campaign).permit(:name, :brand_id, :shop_id, :organization_id, :beacons, :description,
                                     :start_time, :end_time, :enabled,
                                     :header_type, :header_color, :header_txt, :header_txt_color,
                                     :header_txt_type, :product_type, :product_img, :product_name,
                                     :product_txt_color, :product_txt_type, :product_price,
                                     :product_price_txt_color, :product_price_txt_type,
                                     :product_circle_color, :bg_type, :bg_image, :bg_left_color,
                                     :bg_right_color, :bg_color, contents_attributes: %i[text text_color text_type],
                                                                 buttons_attributes: %i[btn_type btn_color youtube_link text text_color],
                                                                 campaign_coupon_attributes: %i[name button_name description notification_text message_text hight_screen_image url],
                                                                 timeframe_attributes: %i[start_time end_time days],
                                                                 campaign_social_profile_attributes: %i[name gender min max])
  end
end
