class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, presence: true
  # FIXME: rollback stripe payment too?
  validates :event, presence: true, uniqueness: { scope: :user, message: "cannot attend twice" }

#  after_create :attendance_send

  def attendance_send
    UserMailer.attendance_email(self).deliver_now
  end

end
