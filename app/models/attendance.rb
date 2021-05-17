class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :welcome_send

  def attendance_created
    UserMailer.attendance_email(self).deliver_now
  end
end
