if @organization
	json.partial! "organization", organization: @organization
else 
	json.message "You are not authorized to access this."
end