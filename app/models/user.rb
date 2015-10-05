class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :walls, :foreign_key => "relative_id"
  has_many :friendships
  has_many :relatives, :through => :friendships
  has_many :friends, :through => :friendships, :foreign_key => "relative_id"

  has_many :reverse_friendships, :class_name => "Friendship", :foreign_key => "relative_id"
  has_many :reverse_relatives, :through => :reverse_friendships, :source => :user
  has_many :reverse_friends, :through => :reverse_friendships, :source => :user

  def is_relative? user
    self.relatives.include? user
  end

  def is_reverse_relative? user
    self.reverse_relatives.include? user
  end

  def self.search query
    if query
      #self.find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
      where(["name LIKE ?", "%#{query}%"])
    else
      all
    end
  end
end
