class DropUnusedTablesAndRemoveUnusedColumns < ActiveRecord::Migration[5.1]
  def change
    drop_table :activities
    drop_table :brand_categories
    drop_table :brand_covers
    drop_table :brand_generals
    drop_table :campaign_content_social_profiles
    drop_table :campaign_content_timeframes
    drop_table :campaign_contents
    drop_table :campaign_locations
    drop_table :product_collections
    drop_table :collections
    drop_table :comment_tags
    drop_table :comments
    drop_table :coupon_pushes
    drop_table :fellowships
    drop_table :news
    drop_table :news_locations
    drop_table :product3ds
    drop_table :reminders
    drop_table :user_favourites
    drop_table :votes
    remove_column :brands, :banner_text_1
    remove_column :brands, :banner_text_2
    remove_column :brands, :cached_votes_total
    remove_column :brands, :cached_votes_score
    remove_column :brands, :cached_votes_up
    remove_column :brands, :cached_votes_down
    remove_column :brands, :cached_weighted_score
    remove_column :brands, :cached_weighted_total
    remove_column :brands, :cached_weighted_average
  end
end
