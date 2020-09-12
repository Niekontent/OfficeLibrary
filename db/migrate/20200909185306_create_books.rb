class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :creator_id
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
