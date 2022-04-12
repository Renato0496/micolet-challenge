class Preference < ApplicationRecord
  validates :opcion, presence: true,
                     uniqueness: true
  # Associations
  has_and_belongs_to_many :users
end
