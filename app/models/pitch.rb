class Pitch < ActiveRecord::Base
  attr_accessible :all, :game_id, :player, :take

  belongs_to :game
end
