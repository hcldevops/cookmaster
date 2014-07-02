class Cookbook < ActiveRecord::Base
	validate :name , presence: true
end
