class Cookbook < ActiveRecord::Base
	# validate :name , presence: true
	has_many :recipes, dependent: :destroy
    validates :name, :presence => true, :length => { :maximum => 50 }, :uniqueness => true

  def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
end
  
end
