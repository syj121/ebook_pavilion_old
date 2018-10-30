module ButtonHelper


  #表格操作按钮
  def operations_column(object, options  = {})
    operations = send("operations_column_#{options[:nested].present?}", object, options)
    operations + send("#{controller_name}_extra_operations", object, options)
  end

  #index页面，操作按钮
  def operations_list(options = {})
    new_url = options[:nested] ?  send("new_#{options[:nested]}_#{single_name}_path") : send("new_#{single_name}_path")
    [
      {link_name: button_label("new"), link_url: new_url, method: :get}
    ]
  end


  #额外操作按钮
  #命名规则：controller_name_extra_operations
  def menus_extra_operations(object, options)
    [link_name: button_label("permission_manage"), link_url: menu_permissions_path(object), method: :get ]
  end

  def method_missing(*args)
    []
  end

  private
  #非嵌套路由
  def operations_column_false(object, options  = {})
    operations = [
      {link_name: button_label("edit"), link_url: send("edit_#{single_name}_path", object), method: :get},
      {link_name: button_label("show"), link_url: send("#{single_name}_path", object), method: :get},
      {link_name: button_label("delete"), link_url: send("#{single_name}_path", object), method: :delete},
    ]
  end
  #非嵌套路由
  def operations_column_true(object, options  = {})
    url = "#{options[:nested]}_#{single_name}" 
    index_controller =  request.path_info.split("/").index("#{controller_name}")
    nested_object = request.path_info.split("/")[index_controller - 1]
    operations = [
      {link_name: button_label("edit"), link_url: send("edit_#{url}_path", 1, object), method: :get},
      {link_name: button_label("show"), link_url: send("#{url}_path", 1, object), method: :get},
      {link_name: button_label("delete"), link_url: send("#{url}_path", 1,object), method: :delete},
    ]
  end



end