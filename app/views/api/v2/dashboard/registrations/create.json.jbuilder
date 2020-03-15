json.organization_manager do 
	json.partial! 'organization_manager', organization_manager: @organization_manager
end 
json.organization do 
	json.partial! 'organization', organization: @organization_manager.organization
end 
if @organization.organization_plan 
	json.organization_plan do 
		json.partial! 'organization_plan', organization_plan: @organization.organization_plan
	end 
end 