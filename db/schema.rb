# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_29_074618) do

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["upload_file_id"], name: "index_events_on_upload_file_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "message"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
  end

  create_table "recommendaitons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id", "group_id"], name: "index_user_groups_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "user_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_user_rooms_on_room_id"
    t.index ["user_id"], name: "index_user_rooms_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "image"
  end

  create_table "youtubes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_rooms", "rooms"
  add_foreign_key "user_rooms", "users"
end
