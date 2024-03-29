class <%= migration_class_name %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
  def change
    create_table :<%= table_name %><%= primary_key_type %> do |t|
<% attributes.each do |attribute| -%>
<% if attribute.password_digest? -%>
      t.string :password_digest<%= attribute.inject_options %>
<% elsif attribute.token? -%>
      t.string :<%= attribute.name %><%= attribute.inject_options %>
<% else -%>
      t.<%= attribute.type %> :<%= attribute.name %><%= attribute.inject_options %>
<% end -%>
<% end -%>
<% if options[:soft_delete] %>
      t.datetime :deleted_at, comment: '删除时间'
      t.boolean  :is_deleted,default: false,comment: '0未删除 1删除'
<% end %>
<% if options[:timestamps] %>
      t.timestamps
<% end -%>
    end

    <% attributes.select(&:token?).each do |attribute| -%>
        add_index :<%= table_name %>, :<%= attribute.index_name %><%= attribute.inject_index_options %>, unique: true
    <% end -%>
    <% attributes_with_index.each do |attribute| -%>
        add_index :<%= table_name %>, :<%= attribute.index_name %><%= attribute.inject_index_options %>
    <% end -%>
    <% if options[:soft_delete] %>
        add_index :<%=  table_name%>, :is_deleted
    <% end%>

    <% if options[:use_tree]%>
     create_table :<%= table_name.singularize%>_hierarchies, id: false do |t|
       t.integer :ancestor_id, null: false
       t.integer :descendant_id, null: false
       t.integer :generations, null: false
     end
     add_index :<%= table_name.singularize%>_hierarchies, [:ancestor_id, :descendant_id, :generations],
       unique: true,
       name: "<%= table_name.singularize%>_anc_desc_idx"

     add_index :<%= table_name.singularize%>_hierarchies, [:descendant_id],
       name: "<%= table_name.singularize%>_desc_idx"
    <% end %>

  end
end
