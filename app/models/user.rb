class User < ApplicationRecord
  has_many :microposts, dependent: :destroy


  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # def User.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ?
  #   BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  #  end
    
    
    
    # Returns a random token.

  # def User.new_token
  #   SecureRandom.urlsafe_base64
  # end

  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    remember_digest
  end

   # Returns true if the given token matches the digest.
   def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?
    (remember_token)
  end
 
   # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def session_token
    remember_digest || remember
  end

  def feed
    Micropost.where(user_id: id)
  end

end
