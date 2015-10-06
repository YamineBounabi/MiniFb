class Wall < ActiveRecord::Base
  belongs_to :user
  belongs_to :relative, :class_name => "User"
  belongs_to :friend, :class_name => "User", :foreign_key => "relative_id"

  scope :personal, -> id { where("user_id IN (?) OR relative_id IN (?)", id, id) }
end
