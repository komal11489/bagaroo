class AddUserToBug < ActiveRecord::Migration
  def change
    add_reference :bugs, :user, index: true
    add_foreign_key :bugs, :users
  end
end
