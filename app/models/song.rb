Rails.application.config.active_record.belongs_to_required_by_default = false
class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :billboard, optional: true
end
