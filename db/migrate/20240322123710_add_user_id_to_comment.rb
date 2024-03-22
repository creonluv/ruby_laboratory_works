class AddUserIdToComment < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :user, index: true
  end
end
