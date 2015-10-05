class Wall < ActiveRecord::Base
  belongs_to :user
  belongs_to :relative, :class_name => "User"
  belongs_to :friend, :class_name => "User", :foreign_key => "relative_id"

  scope :personal, -> id { where("user_id = ? OR relative_id = ?", id, id) }
end
