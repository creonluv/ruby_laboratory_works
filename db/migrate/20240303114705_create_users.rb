class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false, default: ""
      t.string :password
      t.belongs_to :role, index: true, foreign_key: true, default: 1 #Role.find_by_name("USER")
      t.timestamps
    end
  end
end
