module ButtonHelper


  #表格操作按钮
  def operations_column(object)
    [
      {link_name: "edit", link_url: send("edit_background_#{single_name}_path", object), method: :get},
      {link_name: "show", link_url: send("background_#{single_name}_path", object), method: :get},
      {link_name: "delete", link_url: send("background_#{single_name}_path", object), method: :delete},
    ]
  end

  #index页面，操作按钮
  def operations_list
    [
      {link_name: "new", link_url: send("new_background_#{single_name}_path"), method: :get}
    ]
  end

  private
  def single_name
    controller_name.singularize
  end

end