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

require 'faker'

FactoryBot.define do
  factory :brand do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.paragraph }
    logo { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/logo.png'), 'image/png') }
    banner_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/banner.png'), 'image/png') }
    p_name { Faker::Name.unique.name }
    following_standards true
    organization
    category
    categories []
    facebook { Faker::Internet.url('facebook.com') }
    instagram { Faker::Internet.url('instagram.com') }
    pinterest { Faker::Internet.url('pinterest.com') }
    youtube { Faker::Internet.url('youtube.com') }
    twitter { Faker::Internet.url('twitter.com') }
    sat true
    sun true
    from Time.now
    to Time.now + 20.hours
    phone_numbers { [Faker::Base.numerify('010########'), Faker::Base.numerify('010########')] }
    websites { [Faker::Internet.url, Faker::Internet.url] }
    display_name { Faker::Name.unique.name }
    dark_logo { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/logo.png'), 'image/png') }
  end

  factory :invalid_brand, parent: :brand do |b|
    b.name nil
  end
end
