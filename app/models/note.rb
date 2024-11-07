class Note < ApplicationRecord
  belongs_to :appointment
  belongs_to :issue
  # has_one :treatment_plan

  # validates :content, presence: true
  # validates :date, presence: true
end
