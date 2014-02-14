class User < ActiveRecord::Base
  has_many :tasks
  has_many :connections

  validates :email, presence: true, uniqueness: true


end 