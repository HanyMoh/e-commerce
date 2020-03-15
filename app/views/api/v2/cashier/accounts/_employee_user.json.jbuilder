json.extract! employee_user, :id, :name, :email, :shop_id, :job_title, :phone_number, :avatar
if employee_user.power
	json.powers_granted do 
		json.partial! 'power', power: employee_user.power
	end
end