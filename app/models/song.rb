class Song < ApplicationRecord
  # belongs_to :songable, :polymorphic => true
  belongs_to :artist
  belongs_to :board, optional: true
end
