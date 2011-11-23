class User < ActiveRecord::Base
  devise :database_authenticatable, :encryptable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:twitter, :facebook, :google_apps]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me, :is_admin, :lat, :lng, :photo, :phone

  has_many :authentications

  has_attached_file :photo, {
      :url => "/system/:class/:attachment/:id/:style_:basename.:extension",
      :path => ":rails_root/public/system/:class/:attachment/:id/:style_:basename.:extension",
      :styles => {
        :thumbnail => "60x60>",
        :original => "250x250>"
      },
      :default_url => "/images/default_user.png"
  }

  def status
    active_for_authentication? ? 'active' : 'pending'
  end

  def full_name
    return "#{first_name} #{last_name}" if !first_name.blank? and !last_name.blank?
    return first_name if !first_name.blank?
    return last_name if !last_name.blank?
    return email if email
    ''
  end

  def password_required?
    authentications.empty? || !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end

  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    if (!omniauth['user_info']['first_name'].blank? && !omniauth['user_info']['last_name'].blank?)
      first_name = omniauth['user_info']['first_name']
      last_name = omniauth['user_info']['last_name']
    elsif (!omniauth['user_info']['name'].blank?)
      name_array = omniauth['user_info']['name'].split(' ')
      first_name = name_array.first
      last_name = name_array[1..name_array.length].join(' ')
    end
    self.first_name = first_name
    self.last_name = last_name
    set_photo_from_url(omniauth['user_info']['image'])
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def set_photo_from_url(image_url)
    if self.photo_file_name.blank? || self.photo_file_name == 'default_user.pnh'
      begin
        io = open(URI.parse(image_url))
        def io.original_filename; base_uri.path.split('/').last; end
        if !io.original_filename.blank?
          self.photo = io
        end
      rescue
      end
    end
  end

end
