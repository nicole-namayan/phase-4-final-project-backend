class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :imageURL
      t.string :imageAlt
      t.integer :rating
      t.string :title
      t.string :genre
      t.string :description
      t.decimal :price
      t.string :publication_date
      t.string :publisher
      t.string :author
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
