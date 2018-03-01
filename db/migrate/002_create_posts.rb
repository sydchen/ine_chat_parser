class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, force: true do |t|
      t.string :context, null: false
      t.datetime :spoke_at, null: false
      t.belongs_to :user
    end
  end
end
