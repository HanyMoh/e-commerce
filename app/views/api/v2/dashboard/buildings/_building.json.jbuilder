json.extract! building, :id, :name, :area, :floors_count, :description,:organization_id, :building_type, :longitude, :latitude, :banner, :logo
if building.building_levels 
	json.building_levels building.building_levels do |building_level|
		json.extract! building_level, :id, :name, :level, :image
	end 
end 