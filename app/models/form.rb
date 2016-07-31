class Form < ActiveRecord::Base
  has_many :freplies
  def self.search(search)
      where("title Like ? OR content LIKE ? ", "%#{search}%", "%#{search}%")
  end
end
