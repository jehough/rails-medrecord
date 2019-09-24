class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dosage
      t.text :instructions
      t.text :treats
    end
  end
end
