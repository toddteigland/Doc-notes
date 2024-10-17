class TreatmentPlan < ApplicationRecord
  belongs_to :note

  validates :description, presence: true
  validates :frequency, presence: true
  validates :start_date, presence: true
end
