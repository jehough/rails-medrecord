class CreateDosage < ActiveRecord::Migration[5.2]
  def change
    create_table :dosages do |t|
      t.string :type
      t.string :amount
      t.belongs_to :medication, foreign_key: true
    end
  end
end
