class PagesController < ApplicationController
  def index
    @meta_tags = MetaTag.where(shop_id: nil)
    render 'pages/index', layout: 'application'
  end

  def privacy_policy; end
end
