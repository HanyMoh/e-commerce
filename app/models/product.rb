class Product < ApplicationRecord
  include PgSearch
  mount_uploader :cover_image, ImageUploader
  before_save :check_description
  before_save :set_parameterized_name

  BARCODE_REGEX = /^\d+$/

  multisearchable against: :name
  pg_search_scope :pg_search_by_name, against: :name, using: { tsearch: { prefix: true } }

  has_many :sub_products, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :orders, through: :line_items
  has_many :meta_tags, dependent: :destroy
  belongs_to :brand
  belongs_to :category
  belongs_to :organization

  accepts_nested_attributes_for :sub_products, allow_destroy: true,
                                               reject_if: ->(a) { a[:barcode].blank? }

  validates :name, uniqueness: { case_sensitive: false, scope: [:brand_id, :category_id] }
  validates :name, presence: true
  validates :cover_image,
            file_size: { less_than: 1024.kilobytes, message: 'cover_image: should be less than %{count}' },
            file_content_type: { allow: ['image/jpeg', 'image/png'], message: 'cover_image: only %{types} are allowed' }

  def num_of_stocks
    stocks.count
  end

  def sub_products_quantity
    sub_products.map(&:quantity).sum
  end

  def sub_product_min_price
    sub_products.map(&:price).min
  end

  # return current stock quantity in a shop
  # Use it to check quantity availabe in a shop
  def quantity_check_availabilty(shop_id)
    a = sub_products.map do |p|
      p.quantity if p.shop_id == shop_id
    end.reject(&:blank?)
    rv = a[0]
  end

  private

  def check_description
    self.description = name if description.nil? || (description == '')
  end

  # This is a parameterize veriosn of the name
  # in case of query needed with a friendly name
  def set_parameterized_name
    self.p_name = name.parameterize
  end

  scope :random, -> { order('random()') }
  scope :category, ->(category_id) { where category_id: category_id }
  scope :newest_first, -> { order('created_at desc') }
  scope :last_updated_first, -> { order('updated_at desc') }

  scope :by_brand, lambda { |brand_id|
    joins(:brand).where(products: { brand_id: brand_id })
  }

  scope :products_search, lambda { |brand, word|
    word = '%' + word.downcase + '%' if word.present?
    where('brand_id=? AND name ILIKE LOWER(?)', brand, word).order(created_at: :desc)
  }

  scope :search_by_name, lambda { |word|
    word = '%' + word.downcase + '%' if word.present?
    where('name ILIKE LOWER(?)', word).order(created_at: :desc)
  }

  scope :products_search_by_shop, lambda { |shop, word|
    word = '%' + word.downcase + '%' if word.present?
    shop.products.where('name ILIKE LOWER(?)', word).order(created_at: :desc)
  }

  scope :products_search_by_category, lambda { |brand, category, word|
    word = '%' + word.downcase + '%' if word.present?
    where('brand_id=? AND category_id=? AND name ILIKE LOWER(?)', brand, category, word)
  }

  scope :products_search_count, lambda { |brand, category, word|
    products_search_by_category(brand, category, word).count
  }

  scope :random_product, lambda { |brand_id|
    where(brand_id: brand_id).order('RANDOM()')
  }
end
