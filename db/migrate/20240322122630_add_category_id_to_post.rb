class AddCategoryIdToPost < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :category, index: true
  end
end
