module ButtonHelper


  #表格操作按钮
  def operations_column(object)
    [
      {link_name: button_label("edit"), link_url: send("edit_#{single_name}_path", object), method: :get},
      {link_name: button_label("show"), link_url: send("#{single_name}_path", object), method: :get},
      {link_name: button_label("delete"), link_url: send("#{single_name}_path", object), method: :delete},
    ]
  end

  #index页面，操作按钮
  def operations_list
    [
      {link_name: button_label("new"), link_url: send("new_#{single_name}_path"), method: :get}
    ]
  end

  private
  def single_name
    controller_name.singularize
  end

end