class Event < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  has_one_attached :picture

  # Validations desactivated to test faster
  # in the console


  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :picture, presence: true
  validates :admin, presence: true

  validates :title, length: { in: 5..240 }
  validates :description, length: { in: 20..1000 }
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :price, numericality: { less_than_or_equal_to: 1000 }
  validates :duration, numericality: { greater_than_or_equal_to: 0 }

  def validate
    self.validated = true
  end

  def review
    self.reviewed = true
  end

  def self.reviewed
    where(reviewed: true)
  end


  private

  def start_date_is_future
    p start_date
    errors.add(:start_date, "is already over") unless :start_date >= 0
  end

  def duration_is_multiple_of_five
    errors.add(:duration, "is not a multiple of 5 (minutes)") unless duration % 5 == 0
  end

end
