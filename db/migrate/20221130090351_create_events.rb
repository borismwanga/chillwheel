class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :start_point
      t.string :end_point
      t.integer :difficulty
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
