module TitleHelper

  def title_new(object)
    t("new") +  t("models.#{object}", default: [object.camelize])
  end

  def title_edit(object)
    t("edit") +  t("models.#{object}", default: [object.camelize])
  end

  def title_show(object)
    t("show") +  t("models.#{object}", default: [object.camelize])
  end

  def title_button_label(label)
    t label, default: [label]
  end


end