class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :url
      t.boolean :usable
      t.integer :parent_id
      t.text :description

      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,comment: '0未删除 1删除'


      t.timestamps
    end

            
        add_index :menus, :is_deleted
    

    
     create_table :menu_hierarchies, id: false do |t|
       t.integer :ancestor_id, null: false
       t.integer :descendant_id, null: false
       t.integer :generations, null: false
     end
     add_index :menu_hierarchies, [:ancestor_id, :descendant_id, :generations],
       unique: true,
       name: "menu_anc_desc_idx"

     add_index :menu_hierarchies, [:descendant_id],
       name: "menu_desc_idx"
    

  end
end
