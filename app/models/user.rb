class User < ActiveRecord::Base
  is_impressionable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :account_setting      
  before_create :build_profile #-> builds a blank profile on user create
  has_one :profile
         
end
