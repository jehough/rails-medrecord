class CreateDocScheds < ActiveRecord::Migration[5.2]
  def change
    create_table :doc_scheds do |t|
      t.date :date
      t.time :shift_start
      t.time :shift_end
      t.belongs_to :doctor, foreign_key: true
    end
  end
end
