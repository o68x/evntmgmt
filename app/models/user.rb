class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, inverse_of: 'admin'
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  has_one_attached :avatar
  
validates :first_name,
          :last_name,
          :description,
          :email,
          :avatar, presence: true

#  after_create :welcome_send

  def full_name
    [self.first_name, self.last_name].join(' ')
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
