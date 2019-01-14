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

ActiveRecord::Schema.define(version: 2019_01_13_091504) do

  create_table "book_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "图书分类"
    t.integer "books_count", default: 0, comment: "图书总量"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["books_count"], name: "index_book_categories_on_books_count"
    t.index ["is_deleted"], name: "index_book_categories_on_is_deleted"
  end

  create_table "book_category_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "book_category_id", comment: "图书分类外键"
    t.string "desc", comment: "描述"
    t.text "details", comment: "详述"
    t.string "cover", comment: "分类图标"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.index ["book_category_id"], name: "index_book_category_infos_on_book_category_id"
    t.index ["is_deleted"], name: "index_book_category_infos_on_is_deleted"
  end

  create_table "book_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "book_id"
    t.string "desc", comment: "简洁"
    t.text "details", comment: "详细介绍"
    t.string "cover", comment: "封面"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.index ["book_id"], name: "index_book_infos_on_book_id"
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "图书名称"
    t.bigint "book_category_id"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_category_id"], name: "index_books_on_book_category_id"
  end

  create_table "menu_hierarchies", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "menu_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "menu_desc_idx"
  end

  create_table "menu_permission_litems", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "权限明细"
    t.bigint "menu_permission_id"
    t.bigint "menu_id"
    t.boolean "usable", default: true, comment: "是否可用"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_menu_permission_litems_on_is_deleted"
    t.index ["menu_id"], name: "index_menu_permission_litems_on_menu_id"
    t.index ["menu_permission_id"], name: "index_menu_permission_litems_on_menu_permission_id"
  end

  create_table "menu_permissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "权限组名称"
    t.boolean "usable", default: true, comment: "是否可用"
    t.bigint "menu_id"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_menu_permissions_on_is_deleted"
    t.index ["menu_id"], name: "index_menu_permissions_on_menu_id"
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "菜单名"
    t.string "url", comment: "链接地址"
    t.boolean "usable", default: true, comment: "是否可用"
    t.integer "parent_id", comment: "上级菜单"
    t.text "description", comment: "菜单描述"
    t.string "authority_name", comment: "菜单功能权限名称"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_menus_on_is_deleted"
  end

  create_table "menus_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menus_roles_on_menu_id"
    t.index ["role_id"], name: "index_menus_roles_on_role_id"
  end

  create_table "role_hierarchies", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "role_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "role_desc_idx"
  end

  create_table "role_permission_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "权限明细"
    t.bigint "role_permission_id"
    t.bigint "role_id"
    t.boolean "usable", default: true, comment: "是否可用"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_role_permission_items_on_is_deleted"
    t.index ["role_id"], name: "index_role_permission_items_on_role_id"
    t.index ["role_permission_id"], name: "index_role_permission_items_on_role_permission_id"
  end

  create_table "role_permissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "权限组名称"
    t.boolean "usable", default: true, comment: "是否可用"
    t.bigint "role_id"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_role_permissions_on_is_deleted"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "角色名"
    t.boolean "usable", default: false, comment: "是否可用"
    t.integer "parent_id", comment: "上级角色"
    t.text "description", comment: "描述"
    t.datetime "deleted_at", comment: "删除时间"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_roles_on_is_deleted"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", comment: "邮件"
    t.string "encrypted_password", default: "", null: false, comment: "密码"
    t.string "login_name", null: false
    t.string "real_name", default: "匿名", comment: "真实名"
    t.boolean "is_deleted", default: false, comment: "0未删除 1删除"
    t.datetime "deleted_at", comment: "删除时间"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "index_users_on_is_deleted"
    t.index ["login_name"], name: "index_users_on_login_name", unique: true
  end

  add_foreign_key "book_infos", "books"
  add_foreign_key "books", "book_categories"
  add_foreign_key "menu_permission_litems", "menu_permissions"
  add_foreign_key "menu_permission_litems", "menus"
  add_foreign_key "menu_permissions", "menus"
  add_foreign_key "menus_roles", "menus"
  add_foreign_key "menus_roles", "roles"
  add_foreign_key "role_permission_items", "role_permissions"
  add_foreign_key "role_permission_items", "roles"
  add_foreign_key "role_permissions", "roles"
end
