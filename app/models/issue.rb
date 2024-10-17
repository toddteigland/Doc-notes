class Issue < ApplicationRecord
  belongs_to :user
  has_many :appointment_issues
  has_many :appointments, through: :appointment_issues
  has_many :notes

  validates :description, presence: true
  # validates :severity, presence: true
end
