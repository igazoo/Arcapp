class AddUrlToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :url, :text :long_text, :limit => 4294967295

  end
end
