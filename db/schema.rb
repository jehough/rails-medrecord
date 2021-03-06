# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_26_122116) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.date "date"
    t.time "time"
    t.integer "height"
    t.integer "weight"
    t.integer "bmi"
    t.integer "temp"
    t.integer "systolic"
    t.integer "diastolic"
    t.integer "heart_rate"
    t.integer "spo2"
    t.integer "rr"
    t.text "visit_reason"
    t.text "history"
    t.text "neuro"
    t.text "heent"
    t.text "cardiac"
    t.text "respiratory"
    t.text "skin"
    t.text "musculoskeletal"
    t.text "psychosocial"
    t.text "tests_ordered"
    t.text "therapies"
    t.text "follow_up"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doc_scheds", force: :cascade do |t|
    t.date "date"
    t.time "shift_start"
    t.time "shift_end"
    t.integer "doctor_id"
    t.index ["doctor_id"], name: "index_doc_scheds_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.text "treats"
  end

  create_table "patient_meds", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "medication_id"
    t.string "dosage"
    t.text "instructions"
    t.index ["medication_id"], name: "index_patient_meds_on_medication_id"
    t.index ["patient_id"], name: "index_patient_meds_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.text "allergies"
  end

end
