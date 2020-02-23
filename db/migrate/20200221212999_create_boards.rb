class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.belongs_to :artist, :through => :song


      t.timestamps
    end
  end
end
