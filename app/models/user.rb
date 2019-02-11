class User < ApplicationRecord
  has_many :events, inverse_of: 'admin'
  has_many :attendances
  has_many :events, through: :attendances

  after_create :welcome

  def welcome
    # TODO Rien compris UserMailer.
  end

end
