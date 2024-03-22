class AddUserIdToPost < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, index: true
  end
end
