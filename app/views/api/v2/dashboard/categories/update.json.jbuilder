json.partial! "category", category: @category
json.sub_categories @category.sub_categories, :id, :name, :logo