class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
      t.string :name, null: false
      t.boolean :active
    end
  end
end
