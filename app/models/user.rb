class User < ApplicationRecord
  has_many :events, inverse_of: 'admin'
  has_many :attendances
  has_many :events, through: :attendances
end
