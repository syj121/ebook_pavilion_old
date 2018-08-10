<% if namespaced? -%>
<% end -%>
<% module_namespacing do -%>
class <%= class_name %>Policy < ApplicationPolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

end
<% end -%>
