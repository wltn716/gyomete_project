class Post < ActiveRecord::Base
  def self.search(search)
      where("title Like ? OR content LIKE ? ", "%#{search}%", "%#{search}%")
  end
end
