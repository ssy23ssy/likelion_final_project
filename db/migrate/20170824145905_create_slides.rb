class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.integer :order, null: false
      t.string :content
      t.belongs_to :portfolio

      t.timestamps
    end
  end
end
