class Artist < ApplicationRecord
  # has_many :songs, :as => :songable, dependent: :destroy
  # belongs_to :board, optional: true
  has_many :songs, dependent: :destroy
end
