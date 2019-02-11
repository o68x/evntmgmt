class Event < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true
  validates :duration, presence: true # TODO duration positive
  validates :title, presence: true # TODO 5 < length < 140
  validates :price, presence: true # TODO 1 < value < 1000
  validates :location, presence: true

private

  def start_date_is_future

  end

  def duration_is_multiple_of_five

  end

  def duration_is_positive

  end

end

