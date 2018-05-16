class CreateUserImages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_images do |t|
      t.string      :content,  null: false
      t.references  :user,     foreign_key: true
      t.timestamps
    end
  end
end
