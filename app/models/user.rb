class User < ApplicationRecord
  after_create :send_registration_mail, :welcome
  has_many :providers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook github]

  def role?(expected_role)  
    role == expected_role
  end  

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
    provider = Provider.find_or_create_by(name: auth.provider, uid: auth.uid, user_id: user.id)
    user
  end

  def send_registration_mail
    User.where(role: "admin").each do |user|
    UserMailer.with(user: user) .user_created.deliver_now
    end
  end

  def regular?
    self.role == "regular"
  end

  def admin?
    self.role == "admin"
  end
  
  def welcome
    UserMailer.with(user: self).user_welcoming.deliver_now
  end
end
