if shop 
  json.extract! shop, :id, :name, :p_name, :area, :p_area, :country, :city, :street, :floor, :lat, :lng
  json.logo shop.brand.logo_url 
  json.cover_image shop.brand.banner_image_url 
  json.panorama_link panorama_link(shop) 
  json.organization do 
    json.id shop.organization.id
  end 
  json.brand do 
    json.name shop.brand.name
  end 
  json.work_time do 
    json.partial! "work_time", work_time: shop.work_time
  end 
else 
  json.message 'No Shop Matched'
end 

