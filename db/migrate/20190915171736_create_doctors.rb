class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.boolean :admin

      t.timestamps
    end
  end
end
