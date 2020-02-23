class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.belongs_to :board, :through => :song

      t.timestamps
    end
  end
end
