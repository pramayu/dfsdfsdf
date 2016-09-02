class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.decimal :price
      t.datetime :published_at
      t.string :image_url

      t.timestamps
    end
  end
end
