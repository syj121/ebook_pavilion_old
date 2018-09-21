class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :order_num
      t.boolean :show
      t.integer :parent_id

      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,comment: '0未删除 1删除'


      t.timestamps
    end

    add_index :menus, :is_deleted

  end
end
