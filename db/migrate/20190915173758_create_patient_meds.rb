class CreatePatientMeds < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_meds do |t|
      t.belongs_to :patient, foreign_key: true
      t.belongs_to :medication, foreign_key: true
      t.string :dosage
      t.text :instructions
    end
  end
end
