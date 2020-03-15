json.partial! "organization", organization: @organization

json.brands do 
	json.array!(@brands, :id, :name, :p_name, :display_name, :category_id, :logo_url)
end

json.social do 
	json.partial! 'social_links', social_links: @social_links
end 

json.features do 
	json.partial! 'feature', feature: @features
end 

json.themes do 
	json.partial! 'org_theme', organization_theme: @organization_theme
end 
