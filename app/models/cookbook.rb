class Cookbook < ActiveRecord::Base
	# validate :name , presence: true
	has_many :recipes, dependent: :destroy
    validates :name, :presence => true, :length => { :maximum => 50 }, uniqueness: true
    
end
