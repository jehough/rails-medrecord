class CreatePatient < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.text :allergies
    end
  end
end
