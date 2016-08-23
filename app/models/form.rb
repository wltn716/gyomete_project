class Form < ActiveRecord::Base
  belongs_to :writer, class_name: :User

  has_many :favors
  has_many :likers, through: :favors
  
  has_many :freplies
  is_impressionable
  def self.search(search)
      where("title Like ? OR content LIKE ? OR hashtag LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%")
  end
 
end
