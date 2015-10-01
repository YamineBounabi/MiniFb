class UnconfirmedEmail < ActiveRecord::Migration
  def change
    add_column :users, :unconfiremed_email, :string
  end
end
