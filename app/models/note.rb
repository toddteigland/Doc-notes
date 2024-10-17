class Note < ApplicationRecord
  belongs_to :issue
  belongs_to :appointment
  # has_one :treatment_plan

  # validates :content, presence: true
  # validates :date, presence: true
end
