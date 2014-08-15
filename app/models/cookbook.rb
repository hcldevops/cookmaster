class Cookbook < ActiveRecord::Base
	# validate :name , presence: true
	#before_save { self.name = name.downcase }
	has_many :recipes, dependent: :destroy

    validates :name, :presence => true, :length => { :maximum => 50 }, uniqueness: { case_sensitive: false}

  def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  end 
  

  
    

end
