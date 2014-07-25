class Recipe < ActiveRecord::Base
	belongs_to :cookbook
	validates :name, :presence => true, :length => { :maximum => 50 }
  	validates :cookbook_id, :presence => true
end

