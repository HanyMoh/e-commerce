# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.nasnav.com'

SitemapGenerator::Sitemap.create do
  Shop.find_each do |shop|
    next if shop.id == 23
    next if shop.id == 38
    add '/store/' + (shop.building ? shop.building.area.parameterize : shop.street.parameterize) + '/' + shop.brand.p_name + '/' + shop.id.to_s, changefreq: 'daily', lastmod: shop.updated_at
    shop.products.find_each do |product|
      add '/store/' + (shop.building ? shop.building.area.parameterize : shop.street.parameterize) + '/' + product.brand.p_name + '/' + shop.id.to_s + '/products/' + product.id.to_s + '/' + product.p_name, changefreq: 'daily', lastmod: product.updated_at
    end
  end

  # Shop.find(1).products.find_each do |product|
  #  add '/store/' + (product.shop.building ? product.shop.building.area.parameterize : product.shop.street.parameterize) + '/' + product.brand.p_name + '/' + product.shop.id.to_s + '/products/' + product.id.to_s + '/' + product.p_name, :changefreq => 'daily', :lastmod => product.updated_at
  # end

  # Shop.find(29).products.find_each do |product|
  #  add '/store/' + (product.shop.building ? product.shop.building.area.parameterize : product.shop.street.parameterize) + '/' + product.brand.p_name + '/' + product.shop.id.to_s + '/products/' + product.id.to_s + '/' + product.p_name, :changefreq => 'daily', :lastmod => product.updated_at
  # end
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
