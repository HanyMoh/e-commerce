class Order < ApplicationRecord
  before_create :set_status

  PAYMENT_TYPES = {
    1 => 'Credit card',
    2 => 'Check',
    3 => 'Purchase order'
  }.freeze

  enum status: { in_progess: 1, cancelled: 2, deliveried: 3 }

  has_many :line_items, dependent: :destroy
  has_many :entries, dependent: :destroy
  belongs_to :user
  belongs_to :organization
  belongs_to :shop, optional: true

  validates :name, :address, :email, presence: true
  validates :payment_type, presence: true, inclusion: { in: PAYMENT_TYPES.keys.map }

  scope :latest_orders, -> { order(created_at: :desc) }

  scope :newest_first, -> { order('created_at desc') }
  scope :equipped, ->(value) { where(equipped: value) }
  def add_entries_from_pocket(pocket)
    pocket.entries.each do |entry|
      entries << entry
    end
  end

  def amount
    amount = 0
    entries.each do |entry|
      amount += entry.total_price
    end
    amount
  end

  def change_equipped(_status)
    self.equipped = true
  end

  def products_count
    total = 0
    entries.each do |entry|
      total += entry.quantity
    end
    total
  end

  def set_status
    status = 1
  end
end

# == Schema Information
#
# Table name: orders
#
#  id                  :bigint(8)        not null, primary key
#  address             :string(150)
#  cancelation_reasons :string           default([]), is an Array
#  date_delivery       :datetime
#  email               :string(40)
#  name                :string(40)
#  payment_type        :integer          default(0)
#  status              :integer          default("in_progess")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organization_id     :bigint(8)
#  user_id             :bigint(8)
#
# Indexes
#
#  index_orders_on_organization_id  (organization_id)
#  index_orders_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
