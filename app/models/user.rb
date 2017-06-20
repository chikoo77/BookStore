class User < ApplicationRecord
  
  has_many :books
  has_many :reviews
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      #user.name = auth.info.name
      #user.first_name = auth.info.first_name
      #user.last_name = auth.info.last_name
      #user.image = auth.info.image
      user.password = Devise.friendly_token[0,20]
      #user.access_token = auth.credentials.token
      #user.refresh_token = auth.credentials.refresh_token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      #user.save!
    end
  end




    def refresh_token_if_expired
    if token_expired?
      response = RestClient.post "https://accounts.google.com/o/oauth2/token", :grant_type => 'refresh_token', :refresh_token => self.refresh_token, :client_id => ENV['GOOGLE_CLIENT_ID'], :client_secret => ENV['GOOGLE_CLIENT_SECRET']
      refreshhash = JSON.parse(response.body)

      access_token_will_change!
      oauth_expires_at_will_change!

      self.access_token = refreshhash['access_token']
      self.oauth_expires_at = DateTime.now + refreshhash["expires_in"].to_i.seconds

      self.save
      puts 'Saved'
    end
  end

  def token_expired?
    expiry = Time.at(self.oauth_expires_at) 
    return true if expiry < Time.now
    token_expires_at = expiry
    save if changed?
    false
  end
  

end
