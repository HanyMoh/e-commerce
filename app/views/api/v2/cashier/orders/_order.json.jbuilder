json.extract! order, :id, :name, :address, :equipped, :email, :payment_type, :status,:driver_name , :created_at, :date_delivery
json.amount order.amount
json.items_count order.entries.count
json.user do 
	json.partial! "user", user: order.user
end
json.shop do 
	json.name order.shop.name if order.shop
end 
json.organization do 
	json.name order.organization.name if order.organization
end 
json.order_items order.entries do |entry| 
	json.partial! 'entry', entry: entry
end 