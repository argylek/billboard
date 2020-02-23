class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.text :body
      t.belongs_to :artist, foreign_key: true
      t.belongs_to :board, foreign_key: true
      # t.references :songable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
