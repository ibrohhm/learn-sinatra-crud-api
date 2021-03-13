class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string   "name",               limit: 255
      t.integer  "price",              limit: 8
      t.text     "description",        limit: 65535
      t.boolean  "active",                           default: false
      t.integer  "stock",              limit: 4,     default: 1
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def down
    drop_table :products
  end
end
