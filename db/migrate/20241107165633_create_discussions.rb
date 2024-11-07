class CreateDiscussions < ActiveRecord::Migration[7.2]
  def change
    create_table :discussions do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :book_club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
