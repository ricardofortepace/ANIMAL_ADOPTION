class AddAnimalPictureToAnimal < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :animal_picture, :string
  end
end
