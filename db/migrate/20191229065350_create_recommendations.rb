class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.text :url,:limit =>4294967295
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
