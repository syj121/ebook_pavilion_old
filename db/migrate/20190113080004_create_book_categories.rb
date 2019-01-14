class CreateBookCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_categories do |t|
      t.string :name, null: false, comment: "图书分类"
      t.integer :books_count, index: true, default: 0, comment: "图书总量"
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted, default: false, index: true,comment: '0未删除 1删除'
      t.timestamps
    end

    create_table :book_category_infos do |t|
      t.references :book_category, comment: "图书分类外键"
      t.string :desc, comment: "描述"
      t.text :details, comment: "详述"
      t.string :cover, comment: "分类图标"
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted, default: false, index: true,comment: '0未删除 1删除'
    end

  end
end
