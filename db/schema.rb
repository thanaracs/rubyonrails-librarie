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

ActiveRecord::Schema.define(version: 2022_10_18_004655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tb_alunojpa", id: :integer, default: nil, force: :cascade do |t|
    t.string "nome", limit: 255
    t.string "matricula", limit: 255
    t.integer "id_endereco"
  end

  create_table "tb_alunos", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 100
    t.string "matricula", limit: 1000
  end

  create_table "tb_endereco", id: :integer, default: nil, force: :cascade do |t|
    t.string "bairro", limit: 255
    t.string "cep", limit: 255
    t.string "logradouro", limit: 255
  end

  create_table "tb_itemvenda", primary_key: "id_item", id: :integer, default: nil, force: :cascade do |t|
    t.float "quantidade", null: false
    t.float "total_item", null: false
    t.integer "id_produto"
    t.integer "id_venda"
  end

  create_table "tb_produtos", primary_key: "id_produto", id: :integer, default: nil, force: :cascade do |t|
    t.string "descricao", limit: 255
    t.float "valor", null: false
  end

  create_table "tb_venda", primary_key: "id_venda", id: :integer, default: nil, force: :cascade do |t|
    t.date "data"
    t.float "total", null: false
  end

  add_foreign_key "tb_alunojpa", "tb_endereco", column: "id_endereco", name: "fkfq8hj8gekgcfkjl9a2y6du6d9"
  add_foreign_key "tb_itemvenda", "tb_produtos", column: "id_produto", primary_key: "id_produto", name: "fkeuh98ouna39vxn107t9x2k1ah"
  add_foreign_key "tb_itemvenda", "tb_venda", column: "id_venda", primary_key: "id_venda", name: "fktcjhfrwkolom0on5u6p5pw08r"
end
