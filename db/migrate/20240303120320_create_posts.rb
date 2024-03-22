class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.belongs_to :category, index: true, foreign_key: true #, default: 1 #Role.find_by_name("USER")
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
