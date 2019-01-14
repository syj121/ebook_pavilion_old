class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, null: false, comment: "角色名"
      t.boolean :usable, default: false, comment: "是否可用"
      t.integer :parent_id, comment: "上级角色"
      t.text :description, comment: "描述"

      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,index: true,comment: '0未删除 1删除'

      t.timestamps
    end
    
     create_table :role_hierarchies, id: false do |t|
       t.integer :ancestor_id, null: false
       t.integer :descendant_id, null: false
       t.integer :generations, null: false
     end
     add_index :role_hierarchies, [:ancestor_id, :descendant_id, :generations],
       unique: true,
       name: "role_anc_desc_idx"

     add_index :role_hierarchies, [:descendant_id],
       name: "role_desc_idx"
    

  end
end
