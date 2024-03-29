class  HighlandController < ApplicationController
  before_action :set_locale
  before_action :load_object

  layout "background"

  #权限
  include Pundit
  protect_from_forgery


  def set_locale
    I18n.locale = params[:locale]
  end

  #自动加载当前实例变量
  def load_object
    return false if ["new","create"].exclude?(action_name) && params[:id].blank?
    class_name = controller_name.singularize.camelize.constantize
    if params[:id].present?
      object = class_name.find(params[:id])
    elsif ["new", "create"].include?(action_name)
      object = class_name.new
    else
      object = nil
    end
    instance_variable_set("@#{controller_name.singularize}", object)
  end

  #国际化时默认路由
  def default_url_options
    { locale: I18n.locale }
  end
  
end