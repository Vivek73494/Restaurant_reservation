class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table

  TIME_SLOTS = %w[10-11 11-12 12-13 13-14 14-15 15-16 16-17 17-18 18-19 19-20].freeze

  validates :date, presence: true
  validates :time_slot, presence: true, inclusion: { in: TIME_SLOTS }
  validates :table_id, uniqueness: { scope: [:date, :time_slot], message: "is already booked for that date and time slot" }
  validate :date_cannot_be_in_the_past

  private

  def date_cannot_be_in_the_past
    errors.add(:date, "cannot be in the past") if date.present? && date < Date.today
  end
end
