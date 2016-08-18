class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :date
      t.string :time
      t.text :location

      t.timestamps
    end
  end
end
