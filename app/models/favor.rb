class Favor < ActiveRecord::Base
  belongs_to :liker, class_name: :User
  belongs_to :likee, class_name: :Form, foreign_key: :form_id
end
