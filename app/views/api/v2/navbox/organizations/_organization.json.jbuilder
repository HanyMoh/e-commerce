if @organization
  json.extract! organization, :id, :name, :p_name, :description, :type
else 
  json.message 'No Organization Matched'
end
