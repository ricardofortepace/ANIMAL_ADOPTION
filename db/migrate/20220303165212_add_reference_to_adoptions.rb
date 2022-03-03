class AddReferenceToAdoptions < ActiveRecord::Migration[6.1]
  def change
    add_reference :adoptions, :user, null: false, foreign_key: true
    add_reference :adoptions, :animal, null: false, foreign_key: true
  end
end
