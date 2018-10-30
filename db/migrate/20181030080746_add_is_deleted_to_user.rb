class AddIsDeletedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_deleted, :boolean, default: false, comment: "0未删除 1删除"
    add_column :users, :deleted_at, :datetime, comment: "删除时间"
    add_index :users, :is_deleted
  end
end
