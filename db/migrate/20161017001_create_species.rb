class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.references :animal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
