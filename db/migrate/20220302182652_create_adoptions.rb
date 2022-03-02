class CreateAdoptions < ActiveRecord::Migration[6.1]
  def change
    create_table :adoptions do |t|
      t.string :address

      t.timestamps
    end
  end
end
