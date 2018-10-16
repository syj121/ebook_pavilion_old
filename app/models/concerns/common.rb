module Common

  extend ActiveSupport::Concern
  

  #实例方法
  module InstanceMethods

  end

  #类方法
  module ClassMethods
    def boolean_options
      {true => common_label("true"), false => common_label("false")}
    end

    def common_label(label)
      I18n.translate label, default: [label.to_s]
    end
  end
  
 
end