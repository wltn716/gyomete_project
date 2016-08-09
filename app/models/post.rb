class Post < ActiveRecord::Base
  has_many :preplies
  def self.search(search)
      where("title Like ? OR content LIKE ? ", "%#{search}%", "%#{search}%")
  end
end
