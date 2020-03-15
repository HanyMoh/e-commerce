if @organization.organization_theme
  json.extract! @organization.organization_theme, :logo_url, :first_color, :second_color, :first_section, :first_section_product, :first_section_image_url, :second_section, :second_section_product, :second_section_image_url, :slider_body, :slider_header, :slider_images_urls
else 
  json.message 'No Theme Matched'
end
