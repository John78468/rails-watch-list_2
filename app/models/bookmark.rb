class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 8}
  validates_uniqueness_of :movie, scope: [:list_id]
end
