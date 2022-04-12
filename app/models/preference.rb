class Preference < ApplicationRecord
  validates :title, presence: true,
                     uniqueness: true
  # Associations
  has_and_belongs_to_many :users
end
