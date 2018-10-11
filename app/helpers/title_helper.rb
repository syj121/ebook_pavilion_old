module TitleHelper

  #标题国际化
  def subtitle_label(object, label)
    t("subtitle.#{label}") +  t("models.#{object}", default: [object.camelize])
  end

  #按钮国际化
  def button_label(label)
    t "buttons.#{label}", default: [label]
  end

  #index页面，表头国际化
  def table_title_label(label)
    t "#{controller_name}.index.table_title.#{label}", default: ["table_title.#{label}".to_sym, label]
  end



end