class AppointmentIssue < ApplicationRecord
  belongs_to :appointment
  belongs_to :issue
end
