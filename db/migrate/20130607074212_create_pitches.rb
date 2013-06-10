class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.text :player
      t.integer :all
      t.integer :take
      t.integer :game_id

      t.timestamps
    end
  end
end
