class User < ActiveRecord::Base

  has_many :wines, through: :favorites
  has_many :favorites

  # Add handlers to run when creating and saving
  before_create :create_remember_token
  before_save :normalize_fields

  # Validate name:
  validates :first_name,
    presence: true,
    length: { maximum: 50 }

  validates :last_name,
    presence: true,
    length: { maximum: 50 }

  validates :age,
  numericality: { greater_than_or_equal_to: 21}

  # Validate email address:
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Secure password features:
  has_secure_password

  # Create a new remember token for a user:
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Hash a token:
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def to_favorite(wine)
    binding.pry
    if wine.new_record?
      # Purchase.create(user_id: self.id, song_id: song.id)
      self.wines << wine
    end
  end

  private

  # Creates a new session token for the user:
  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

  # Normalize fields for consistency:
  def normalize_fields
    self.email.downcase!
  end

end
