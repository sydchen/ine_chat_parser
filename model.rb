require 'active_record'

class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy

  validates :name, :presence => true
end

class Post < ActiveRecord::Base
  belongs_to :user

  validates :context, :presence => true
end
