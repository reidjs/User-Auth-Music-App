class User < ApplicationRecord
  attr_reader :password
  validates :email, :password_digest, :session_token, presence: true

  after_initialize :ensure_token
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end
  def gen_token
    SecureRandom::urlsafe_base64
  end

  def ensure_token
    self.session_token ||= gen_token
  end

  def reset_token!
    self.session_token = gen_token
    self.save!
    self.session_token

  end

  def validate_password(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    u = User.find_by(email: email)
    return nil if u.nil?
    if u.validate_password(password)
      return u
    end
    nil
  end
end
