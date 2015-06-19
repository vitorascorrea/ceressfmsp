# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150618234219) do

  create_table "bairros", force: true do |t|
    t.string   "bairro"
    t.string   "subprefeitura"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chamados", force: true do |t|
    t.text     "itens"
    t.float    "total"
    t.string   "nomec"
    t.string   "cpf"
    t.string   "telefone1"
    t.string   "telefone2"
    t.string   "nomef"
    t.string   "endvel"
    t.string   "subprefeitura"
    t.datetime "datahorariovel"
    t.string   "nomee"
    t.string   "formapag"
    t.string   "status",                 default: "Aberto"
    t.string   "floricultura_escolhida"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floriculturas", force: true do |t|
    t.string   "email"
    t.string   "nomefloricultura"
    t.string   "endfloricultura"
    t.string   "subprefeitura"
    t.integer  "posicao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", force: true do |t|
    t.string   "nomeproduto"
    t.text     "descproduto"
    t.float    "precoproduto"
    t.string   "imgproduto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
