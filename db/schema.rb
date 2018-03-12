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

ActiveRecord::Schema.define(version: 20_180_226_022_015) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'street'
    t.string 'city'
    t.string 'state'
    t.string 'zip'
    t.integer 'addressable_id'
    t.string 'addressable_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[addressable_id addressable_type], name: 'index_addresses_on_addressable_id_and_addressable_type'
  end

  create_table 'companies', force: :cascade do |t|
    t.string 'name'
    t.string 'image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'image_url'
    t.integer 'company_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_projects_on_company_id'
  end

  create_table 'projects_users', id: false, force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'project_id', null: false
    t.index ['project_id'], name: 'index_projects_users_on_project_id'
    t.index ['user_id'], name: 'index_projects_users_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.integer 'company_id'
    t.boolean 'admin', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_users_on_company_id'
  end
end
