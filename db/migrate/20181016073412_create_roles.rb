class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :usable
      t.integer :parent_id
      t.text :description

      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,comment: '0未删除 1删除'


      t.timestamps
    end

            
        add_index :roles, :is_deleted
    

    
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
