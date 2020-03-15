# == Schema Information
#
# Table name: brands
#
#  id                  :bigint(8)        not null, primary key
#  banner_image        :string
#  categories          :string           default([]), is an Array
#  dark_logo           :string
#  description         :string
#  display_name        :string
#  facebook            :string
#  following_standards :boolean          default(FALSE)
#  fri                 :boolean          default(FALSE)
#  from                :time
#  google_plus         :string
#  instagram           :string
#  logo                :string
#  mon                 :boolean          default(FALSE)
#  name                :string
#  p_name              :string
#  phone_numbers       :string           default([]), is an Array
#  pinterest           :string
#  sat                 :boolean          default(FALSE)
#  snapchat            :string
#  stock_management    :boolean          default(TRUE)
#  sun                 :boolean          default(FALSE)
#  thu                 :boolean          default(FALSE)
#  to                  :time
#  tue                 :boolean          default(FALSE)
#  twitter             :string
#  websites            :string           default([]), is an Array
#  wed                 :boolean          default(FALSE)
#  youtube             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  organization_id     :bigint(8)
#
# Indexes
#
#  index_brands_on_organization_id  (organization_id)
#

class BrandSerializer < ActiveModel::Serializer
  attributes :name, :logo_url
end
