class User < ActiveRecord::Base
  has_many :tasks

  validates :uid, :name, :provider, :email, presence: true

end
