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

ActiveRecord::Schema.define(version: 2018_10_10_014056) do

  create_table "menu_hierarchies", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "menu_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "menu_desc_idx"
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "菜单名"
    t.string "url", default: "", comment: "菜单链接"
    t.integer "parent_id", comment: "父id"
    t.boolean "usable", default: false, comment: "是否可用"
    t.text "description", comment: "菜单描述"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_menus_on_is_deleted"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "login_name", default: "anonymous20180807160327", null: false
    t.string "real_name", default: "匿名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_name"], name: "index_users_on_login_name", unique: true
  end

end
