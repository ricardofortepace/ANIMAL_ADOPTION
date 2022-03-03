class AddBreedToAnimal < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :breed, :string
  end
end
