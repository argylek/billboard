module Songable
  def self.included(song)
    song.class_eval do
      has_one :song
    end
  end
end
