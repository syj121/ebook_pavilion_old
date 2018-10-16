module TitleHelper

  #标题国际化
  def subtitle_label(object, label, option={})
    t("subtitle.#{label}") +  t("models.#{object}", default: [object.camelize])
  end

  #按钮国际化
  def button_label(label)
    t "buttons.#{label}", default: [label.to_s]
  end

  #index页面，表头国际化
  def table_title_label(label)
    t "#{controller_name}.attributes.#{label}", default: ["attributes.#{label}".to_sym, label.to_s]
  end

  #search表单，筛选条件国际化
  def search_form_label(label)
    t "#{controller_name}.attributes.#{label}", default: ["attributes.#{label}".to_sym, label.to_s]
  end

  def include_blank_label(label)
    t "#{controller_name}.attributes.#{label}", default: [label]
  end

  def common_label(label)
    t label, default: [label.to_s]
  end

end