	class Recipe < ActiveRecord::Base
	belongs_to :cookbook
	before_save { |recipe| recipe.name = name << ".rb"}
	validates :name, :presence => true, :length => { :maximum => 50 } , uniqueness: {case_sensitive: false }

	validates :cookbook_id, :presence => true
end

