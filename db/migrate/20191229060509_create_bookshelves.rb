class CreateBookshelves < ActiveRecord::Migration[5.2]
  def change
    create_table :bookshelfs do |t|
      t.string :url
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
