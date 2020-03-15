json.extract! user, :id, :authentication_token, :email, :name
json.type user_type(user)
if user_type(user) == 'EmployeeUser'
	if user.power 
		json.powers_granted do 
			json.partial! 'power', power: user.power
		end
	end
else 
	json.organization_id user.organization_id
	json.shops user.organization.shops.pluck(:id)
end
