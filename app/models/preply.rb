class Preply < ActiveRecord::Base
    belongs_to :writer, class_name: :User
    belongs_to :post
end
