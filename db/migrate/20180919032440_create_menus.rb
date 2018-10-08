class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name,  null: false, comment: "菜单名"
      t.integer :order_num, default: 1, comment: "排序"
      t.boolean :show, default: true, comment: "是否展示"
      t.integer :parent_id, comment: "上级父id"
      t.string :url, default: "", comment: "菜单地址"

      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,comment: '0未删除 1删除'


      t.timestamps
    end

    add_index :menus, :is_deleted

  end
end
