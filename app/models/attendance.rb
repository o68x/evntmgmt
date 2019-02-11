class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, presence: true
  validates :event, presence: true

  after_create :welcome

  def welcome
    # TODO Rien compris encore
  end
end
