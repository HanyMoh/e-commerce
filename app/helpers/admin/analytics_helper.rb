require 'fusioncharts-rails'

module Admin::AnalyticsHelper
  def total_products_stats(model)
    dates = if current_manager
              products = Product.where(brand: current_manager.brands)
              products.select('created_at').map { |i| i.created_at.year }.uniq.sort
            else
              get_dates_for_model(model)
            end
    return_result(dates, products ||= Product)
  end

  def total_visits_stats; end

  def shop360_views_stats(model)
    dates = if current_manager
              sections = Section.where(shop360_id: brand_shops(current_manager.brands))
              sections.select('created_at').map { |i| i.created_at.year }.uniq.sort
            else
              get_dates_for_model(model)
            end
    return_result(dates, sections ||= Section)
  end

  def total_campaigns_stats(model)
    dates = if current_manager
              campaigns = Campaign.where(shop_id: brand_shops(current_manager.brands))
              campaigns.select('created_at').map { |i| i.created_at.year }.uniq.sort
            else
              get_dates_for_model(model)
            end
    return_result(dates, campaigns ||= Campaign)
  end

  def total_beacons_stats(model)
    dates = if current_manager
              beacons = Beacon.where(brand: current_manager.brands)
              beacons.select('created_at').map { |i| i.created_at.year }.uniq.sort
            else
              get_dates_for_model(model)
            end
    return_result(dates, beacons ||= Beacon)
  end

  def total_orders_stats(_model)
    ids = []
    dates = if current_manager
              products = filter_products(current_manager)
              products.each do |p|
                ids += p.order_ids
              end
              orders = Order.where(id: ids)
              orders.select('created_at').map { |i| i.created_at.year }.uniq.sort
            else
              orders = Order.all
              orders.select('created_at').map { |i| i.created_at.year }.uniq.sort
            end
    return_result(dates, orders)
  end

  def best_products_sold
    result = []
    if current_manager
      products = Product.where(brand: current_manager.brands)
      products.each do |p|
        count = p.line_items.joins(:order).where('orders.status = ?', 3).count
        result << { label: p.name, value: count }
      end
    else
      products = Product.all
      products.each do |p|
        count = p.line_items.joins(:order).where('orders.status = ?', 3).count
        result << { label: p.name, value: count }
      end
    end
    result = result.sort_by { |hsh| hsh[:value] }.last(5)
    result
  end

  def total_sales_stats
    result = []
    counts = []
    ids = []
    dates = if current_manager
              products = filter_products(current_manager)
              products.each do |p|
                ids += p.order_ids
              end
              orders = Order.where(id: ids.uniq).where(status: 3)
              orders = orders.select('created_at').map { |i| i.created_at.year }.uniq.sort
            else
              orders = Order.where(status: 3)
              orders = orders.select('created_at').map { |i| i.created_at.year }.uniq.sort
            end
    dates.each do |d|
      count = 0
      orders = Order.where('extract(year from created_at) = ?', d.to_i)
      orders.each do |order|
        order.line_items.each do |line|
          count += line.total_price
        end
      end
      result << { label: d.to_s, value: count.to_i }
      counts << count
    end
    result = result.sort_by { |hsh| hsh[:label] }
    [result, counts.sum]
  end

  private

  def return_result(dates, data)
    counts = []
    result = []
    dates.each do |d|
      counts << data.where('extract(year from created_at) = ?', d.to_i).count
    end
    i = 0
    dates.each do |d|
      result << { label: d.to_s, value: counts[i].to_s }
      i += 1
    end
    [result, counts.sum]
  end

  # Used in case current admin
  def get_dates_for_model(model)
    model.all.select('created_at').map { |i| i.created_at.year }.uniq.sort
  end

  def filter_products(user)
    if user == current_manager
      Product.where(brand: user.brands)
    else
      Product.all
    end
  end
end
