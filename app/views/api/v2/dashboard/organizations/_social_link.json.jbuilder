if @organization.social_link
  json.extract! @organization.social_link, :facebook, :twitter, :instagram
else 
  json.message 'No Social Links Matched'
end
