class Table < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :table_number, presence: true, uniqueness: true
  validates :capacity, presence: true, numericality: { greater_than: 0 }
end
