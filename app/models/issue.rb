class Issue < ApplicationRecord
  has_many :appointment_issues, dependent: :destroy
  has_many :appointments, through: :appointment_issues 
  has_many :notes, through: :appointments, dependent: :destroy

  validates :description, presence: true
  # validates :severity, presence: true
end
