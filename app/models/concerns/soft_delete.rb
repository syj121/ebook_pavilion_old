module SoftDelete
  extend ActiveSupport::Concern

  #默认查询未删除的记录
  included do 
    default_scope -> { where(is_deleted: false) }
  end

  #重写删除方法，重新定义run_callbacks
  def destroy
    run_callbacks :destroy do 
      update(is_deleted: true, deleted_at: Time.now)
    end
  end

  #类方法 
  module ClassMethods
    
  end
  #类方法  end
  
  #-----------------------------------------------------------------------------------------------------------------------------------
  #-----------------------------------------------------------------------------------------------------------------------------------

  #实例方法
  module InstanceMethods
    
  end
  #实例方法 END
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end