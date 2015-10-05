class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :relative, :class_name => "User"
  belongs_to :friend, :class_name => "User", :foreign_key => "relative_id"

  validates :relative_id, uniqueness: { scope: :user_id, message: "friended already" }
end
