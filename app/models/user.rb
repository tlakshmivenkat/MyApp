class User < ActiveRecord::Base
has_one :image, as: :entity
  accepts_nested_attributes_for :image

  before_save do |user|
self.password = Digest::MD5.hexdigest(password)
  end
  def self.authenticate(user) 
     @user= User.where(:email=>user["email"], :password=>Digest::MD5.hexdigest(user["password"])).first
     if !@user.blank?
        @user
    else
    	nil
     end
  end
end
