class Post < ActiveRecord::Base
  belongs_to :writer, class_name: :User
  has_many :preplies
    is_impressionable
  def self.search(search)
      where("title Like ? OR content LIKE ? ", "%#{search}%", "%#{search}%")
  end
end
