class CreateMacros < ActiveRecord::Migration[5.2]
  def change
    create_table :macros do |t|
      t.belongs_to :appointment, foreign_key: true
      t.integer :height
      t.integer :weight
      t.integer :bmi
      t.integer :temp
      t.integer :systolic
      t.integer :diastolic
      t.integer :heart_rate
      t.integer :spo2
      t.integer :rr
      t.text :visit_reason
      t.text :history
      t.text :neuro
      t.text :heent
      t.text :cardiac
      t.text :respiratory
      t.text :skin
      t.text :musculoskeletal
      t.text :psychosocial
      t.text :tests_ordered
      t.text :therapies
      t.text :follow_up
    end
  end
end
