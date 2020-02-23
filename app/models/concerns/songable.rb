module Songable
  extend ActiveSupport::Concern

  included do
    has_many :songs, :as => :songable
  end
end
