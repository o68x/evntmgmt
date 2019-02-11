class PriceRangeValidator < ActiveModel::Validator
  def validate(record)
    p record
    if record.price < 1 && record.price > 1000
      record.errors.add(:price, "must be in the tolerated range")
    end
  end
end

class Event < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :admin, presence: true

  validates :title, length: { in: 5..240 }
  validates :description, length: { in: 20..1000 }
  validates :price, numericality: { only_integer: true }

  # validates_with PriceRangeValidator

  private

  def start_date_is_future
    start_date.future?
  end

  def duration_is_multiple_of_five
    duration % 5 == 0 ? true : false
  end

  def duration_is_positive
    duration > 0 ? true : false
  end


end

