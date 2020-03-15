if feature
  json.extract! feature, :cart, :campaign, :beacon, :panorama360
else 
  json.message 'No Feature added yet.'
end
