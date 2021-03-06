class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :set_admin
  def set_admin

  	@cookbook = Cookbook.new
  	@cookbooks = Cookbook.all
  	@recipe = @cookbook.recipes.build   

  end

  
end
