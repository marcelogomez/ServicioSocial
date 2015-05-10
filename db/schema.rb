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

ActiveRecord::Schema.define(version: 20150423150114) do

  create_table "admins", force: :cascade do |t|
    t.string   "login"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "correo"
    t.string   "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "asignacion_proyectos", force: :cascade do |t|
    t.integer  "proyecto_id"
    t.integer  "usuario_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "carreras", force: :cascade do |t|
    t.string   "nombre"
    t.string   "iniciales"
    t.integer  "semestres"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dia_horas", force: :cascade do |t|
    t.integer  "dia"
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "horario_id"
  end

  create_table "horarios", force: :cascade do |t|
    t.integer  "capacidad"
    t.integer  "proyecto_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lista_espera_proyectos", force: :cascade do |t|
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "aprobada"
    t.integer  "horario_id"
  end

  create_table "proyecto_carreras", force: :cascade do |t|
    t.integer  "proyecto_id"
    t.integer  "carrera_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "proyectos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "registro_inicio"
    t.datetime "registro_fin"
    t.integer  "ubicacion_id"
    t.integer  "admin_id"
    t.integer  "horas"
    t.string   "requisitos"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "semestre_minimo"
    t.integer  "semestre_max"
  end

  create_table "ubicacions", force: :cascade do |t|
    t.string   "name"
    t.string   "iniciales"
    t.string   "direccion"
    t.string   "descripcion"
    t.string   "maps"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "matricula"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "carrera_id"
    t.integer  "semestre"
    t.string   "telefono"
    t.string   "correo"
    t.string   "facebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
