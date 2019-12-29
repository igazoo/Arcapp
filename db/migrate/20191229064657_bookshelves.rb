class Bookshelves < ActiveRecord::Migration[5.2]
  def change
    drop_table :bookshelves
  end
end
