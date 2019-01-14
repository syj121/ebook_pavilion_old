class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    #菜单权限组
    create_table :menu_permissions do |t|
      t.string :name, null: false, comment: "权限组名称"
      t.boolean :usable, default: true, comment: "是否可用"
      t.references :menu, foreign_key: true
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false, index: true, comment: '0未删除 1删除'
      t.timestamps
    end        
    #菜单权限明细
    create_table :menu_permission_litems do |t|
      t.string :name, null: false, comment: "权限明细"
      t.references :menu_permission, foreign_key: true
      t.references :menu, foreign_key: true
      t.boolean :usable, default: true, comment: "是否可用"
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,index: true, comment: '0未删除 1删除'
      t.timestamps
    end      
    #菜单角色关联表
    create_table :menus_roles do |t|
      t.references :menu, foreign_key: true
      t.references :role, foreign_key: true
      t.timestamps
    end  
    #角色权限组
    create_table :role_permissions do |t|
      t.string :name, null: false, comment: "权限组名称"
      t.boolean :usable, default: true, comment: "是否可用"
      t.references :role, foreign_key: true
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,index: true, comment: '0未删除 1删除'
      t.timestamps
    end  
    #角色权限明细
    create_table :role_permission_items do |t|
      t.string :name, null: false, comment: "权限明细"
      t.references :role_permission, foreign_key: true
      t.references :role, foreign_key: true
      t.boolean :usable, default: true, comment: "是否可用"
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,index: true, comment: '0未删除 1删除'
      t.timestamps
    end  

  end
end
