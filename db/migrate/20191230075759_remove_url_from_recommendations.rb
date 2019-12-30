class RemoveUrlFromRecommendations < ActiveRecord::Migration[5.2]
  def change
    remove_column :recommendations, :url, :string
  end
end
