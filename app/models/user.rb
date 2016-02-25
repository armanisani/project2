class User < ActiveRecord::Base
  has_secure_password
  has_many :arts, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email,uniqueness: true, presence: true
  validates :first, presence: true
  validates :last, presence: true
  validates :age, presence: true
  # validates :password, presence: true

  def already_likes?(art)
      self.likes.where("art_id = #{art.id}").count > 0
    end


  has_attached_file :avatar, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "50x50>" }, default_url: "https://account.socialbakers.com/default_user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


end
