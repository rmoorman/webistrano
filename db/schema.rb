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

ActiveRecord::Schema.define(version: 20150508100348) do

  create_table "configuration_parameters", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "project_id"
    t.integer  "stage_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prompt_on_deploy", default: 0
  end

  create_table "deployments", force: true do |t|
    t.string   "task"
    t.text     "log"
    t.integer  "stage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_at"
    t.text     "description"
    t.integer  "user_id"
    t.string   "excluded_host_ids"
    t.string   "revision"
    t.integer  "pid"
    t.string   "status",            default: "running"
  end

  create_table "deployments_roles", id: false, force: true do |t|
    t.integer "deployment_id"
    t.integer "role_id"
  end

  create_table "hosts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_configurations", force: true do |t|
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_versions", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "version"
    t.string   "name"
    t.text     "body"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes_stages", id: false, force: true do |t|
    t.integer "recipe_id"
    t.integer "stage_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "stage_id"
    t.integer  "host_id"
    t.integer  "primary",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "no_release", default: 0
    t.integer  "ssh_port"
    t.integer  "no_symlink", default: 0
  end

  create_table "stage_configurations", force: true do |t|
  end

  create_table "stages", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "alert_emails"
    t.integer  "locked_by_deployment_id"
    t.integer  "locked",                  default: 0
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "time_zone",              default: "UTC"
    t.datetime "disabled_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["disabled_at"], name: "index_users_on_disabled_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
