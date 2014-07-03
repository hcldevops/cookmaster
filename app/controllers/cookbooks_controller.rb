class CookbooksController < ApplicationController
  def index
  end

  def new
  end

  def show

	@cookbook = Cookbook.new

  	if !signed_in?
  		redirect_to root_url
  	end
  end
end
