module Api::V2::Navbox::ShopsHelper
  def panorama_link(shop)
    shop.shop360.web_json_data['panorama'] if shop.shop360.web_json_data
  end

  def time(date)
    date.nil? ? '' : date.strftime('%H:%m %p')
  end
end
