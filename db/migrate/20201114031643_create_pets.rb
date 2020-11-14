class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :breed
      t.integer :type_of_animal
      t.timestamps
    end
  end
end
