class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.references :book_club, null: false, foreign_key: true
      t.datetime :start_time

      t.timestamps
    end
  end
end
