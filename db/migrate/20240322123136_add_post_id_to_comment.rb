class AddPostIdToComment < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :post, index: true
  end
end
