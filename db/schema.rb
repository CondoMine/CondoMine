# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_17_185852) do
  create_table "ambientes", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "condominos", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "contato"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "funcao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "nome"
    t.string "estado"
    t.string "tipo"
    t.date "data_entrada"
    t.integer "ambiente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ambiente_id"], name: "index_items_on_ambiente_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.date "data_ini"
    t.date "data_fim"
    t.time "hora_ini"
    t.time "hora_fim"
    t.integer "condomino_id", null: false
    t.integer "ambiente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ambiente_id"], name: "index_reservas_on_ambiente_id"
    t.index ["condomino_id"], name: "index_reservas_on_condomino_id"
  end

  add_foreign_key "items", "ambientes"
end
