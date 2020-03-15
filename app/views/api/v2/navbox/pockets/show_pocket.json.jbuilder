json.partial! "pocket", pocket: @pocket
unless @pocket.entries.empty? 
  json.entries @pocket.entries do |entry|
    json.partial! 'entry', entry: entry
  end 
end
