class User < ApplicationRecord
	before_save :downcase_email
	before_create :save_token_to_user
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 200 }, 
			format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true
	has_many :posts

	# Generates new, encrypted remember token
	def self.new_remember_token
		SecureRandom.urlsafe_base64
	end

	# Encrypts token
	def self.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	# Downcases emails
	def downcase_email
		email.downcase!
	end

	# Saves remember_token to User upon creation
	def save_token_to_user
		self.remember_token = User.digest(User.new_remember_token)
	end
end