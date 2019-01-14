module ButtonHelper


  #表格操作按钮
  def operations_column(object, options  = {})
    operations = send("operations_column_#{options[:nested].present?}", object, options)
    operations.concat send("#{controller_name}_table_operations", object, options)
  end

  #index页面，操作按钮
  def operations_list(options = {})
    new_url = options[:nested] ?  send("new_#{options[:nested]}_#{single_name}_path") : send("new_#{single_name}_path")
    operations = [{link_name: button_label("new"), link_url: new_url, method: :get}]
    operations.concat send("#{controller_name}_index_operations", options)
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

  #表格额外操作按钮
  #命名规则：controller_name_table_operations
  def menus_table_operations(object, options)
    [link_name: button_label("permission_manage"), link_url: menu_permissions_path(object), method: :get ]
  end

  def roles_table_operations(object, options)
    [{link_name: button_label("menus_manage"), link_url: menus_role_path(object), method: :get},
     {link_name: button_label("permissions_manage"), link_url: permissions_role_path(object), method: :get}
    ]
  end
  #表格额外操作按钮 END

  #index额外操作按钮
  #命名规则：controller_name_index_operations
  def permissions_index_operations(options)
    [link_name: button_label("back"), link_url: menus_path, method: :get ]
  end
  #表格额外操作按钮 END



end