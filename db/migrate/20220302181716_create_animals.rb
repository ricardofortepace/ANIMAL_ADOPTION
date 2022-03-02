class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :specie
      t.string :genre
      t.integer :age
      t.boolean :castrate

      t.timestamps
    end
  end
end
