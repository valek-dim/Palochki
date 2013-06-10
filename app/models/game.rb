class Game < ActiveRecord::Base
  attr_accessible :steps, :winner
  has_many :pitches
end
