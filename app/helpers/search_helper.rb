#ransack的search表单
module SearchHelper

  #search_hash = {field_type: :cont, attribute_name: :name, attribute_type: :string}
  #field_type: 表单ID
  #attribute_name: 标签名
  #attribute_type: 字段类型
  def ransack_search(form, search_hash)
    options = search_hash[:options].presence || {}
    collection = ransack_search_option(search_hash)
    field_name = ransack_search_field_name(search_hash, collection)
    form.input field_name, {placeholder: search_form_label(search_hash[:attribute_name]), collection: collection}.merge(options)
  end

  #下拉选择框collection
  def ransack_search_option(search_hash)
    attribute_name = search_hash[:attribute_name]
    return controller_class.boolean_options.invert  if search_hash[:attribute_type] == :boolean
    controller_class.respond_to?("#{attribute_name.to_s.camelize.upcase}")  ?  controller_class.send(attribute_name.camelize).invert : nil
  end

  #表单名称
  def ransack_search_field_name(search_hash, collection)
    search_hash[:field_type] ||= collection ? :eq : :cont
    "#{search_hash[:attribute_name]}_#{search_hash[:field_type]}".to_sym
  end

end