class User < ActiveRecord::Base

	before_create :encrypt_password

	validates :username, :password, presence: true
	validates :username, uniqueness: true

  has_many :decks, :through => :rounds
  has_many :rounds

  def self.authenticate(username, password)
  	user = self.find_by_username(username)
  	temp_encryption = Digest::SHA1.hexdigest("#{password}")
  	user.password == temp_encryption ? user : nil
  end

	def encrypt_password
 		encrypted_password = Digest::SHA1.hexdigest("#{password}")
		self.password = encrypted_password
	end

end
