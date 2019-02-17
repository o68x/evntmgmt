class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, inverse_of: 'admin'
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  has_one_attached :avatar
  
# REF 2019-02-17 Validation deactivated for heroku...
=begin
  validates :first_name,
          :last_name,
          :description,
          :email,
          :avatar, presence: true
=end
#  after_create :welcome_send

  def is_user_admin?
    self.email == 'admin@evntmgmt.com' ? true : false
  end

  def full_name
    [self.first_name, self.last_name].join(' ')
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
