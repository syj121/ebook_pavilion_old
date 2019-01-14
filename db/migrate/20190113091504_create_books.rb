class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, comment: "图书名称"
      t.references :book_category, foreign_key: true
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,comment: '0未删除 1删除'
      t.timestamps
    end

    create_table :book_infos do |t|
      t.references :book, foreign_key: true
      t.string :desc, comment: "简洁"
      t.text :details, comment: "详细介绍"
      t.string :cover, comment: "封面"
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,comment: '0未删除 1删除'
    end

  end
end
