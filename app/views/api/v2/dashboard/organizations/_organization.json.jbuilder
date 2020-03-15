if organization
  json.extract! organization, :id, :name, :description, :type
  json.brands do 
	json.array!(@brands, :id, :name, :display_name, :category_id, :logo_url)
end
json.social do 
	json.partial! 'social_link', social_link: @social_link
end 
json.feature do 
	json.partial! 'feature', feature: @feature
end 
json.theme do 
	json.partial! 'org_theme', organization_theme: @organization_theme
end 

else 
  json.message 'No Organization Matched'
end
