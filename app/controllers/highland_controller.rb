class  HighlandController < ApplicationController
  layout "background"

  #权限
  include Pundit
  protect_from_forgery

  
end