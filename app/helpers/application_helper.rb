module ApplicationHelper

    def single_name
      controller_name.singularize
    end

    def controller_class
      single_name.camelize.constantize rescue Object
    end

end
