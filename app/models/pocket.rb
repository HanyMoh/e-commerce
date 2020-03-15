class Pocket < ApplicationRecord
  belongs_to :user, optional: true
  has_many :entries

  accepts_nested_attributes_for :entries

  def update_entries(entries, values)
    values = values.sort_by { |k| k[:id].to_i }
    entries.zip(values).each do |entry, value|
      entry.update(value)
    end
  end

  def total_price
    entries.sum(&:total_price)
  end
end
