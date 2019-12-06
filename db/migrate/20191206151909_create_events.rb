class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string "title"
      t.string "image"
      t.string "location"
      t.string "url"
      t.datetime "deleted_at"
      t.bigint "upload_file_id"
      t.string "site"
      t.string "owner"
      t.boolean "publish_flg"
      t.datetime "started_at"
      t.datetime "ended_at"
      t.float "lat"
      t.float "lon"
      t.string "address"
      t.text "description"
      t.integer "status", default: 0, null: false
      t.index ["upload_file_id"], name: "index_events_on_upload_file_id"

      t.timestamps
    end
  end
end
