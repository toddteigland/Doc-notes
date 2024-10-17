class Appointment < ApplicationRecord
  belongs_to :user
  has_many :appointment_issues
  has_many :issues, through: :appointment_issues
  has_many :notes

  # validates :date, presence: true
  # validates :doctor_name, presence: true
end
