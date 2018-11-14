class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :value
      t.belongs_to :stall, foreign_key: true

      t.timestamps
    end
  end
end
