json.extract! employee_user, :id, :name, :job_title, :email, :phone_number,:authentication_token, :organization_manager_id, :avatar
json.organization employee_user.organization.name
json.organization_manager employee_user.organization_manager.name
json.shop employee_user.shop.name
if employee_user.power
	json.powers_granted do 
		json.partial! 'power', power: employee_user.power
	end
end