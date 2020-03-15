class AddCachedVotesToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :cached_votes_total, :integer, :default => 0
    add_column :news, :cached_votes_score, :integer, :default => 0
    add_column :news, :cached_votes_up, :integer, :default => 0
    add_column :news, :cached_votes_down, :integer, :default => 0
    add_column :news, :cached_weighted_score, :integer, :default => 0
    add_column :news, :cached_weighted_total, :integer, :default => 0
    add_column :news, :cached_weighted_average, :float, :default => 0.0
    add_index  :news, :cached_votes_total
    add_index  :news, :cached_votes_score
    add_index  :news, :cached_votes_up
    add_index  :news, :cached_votes_down
    add_index  :news, :cached_weighted_score
    add_index  :news, :cached_weighted_total
    add_index  :news, :cached_weighted_average
  end
end
