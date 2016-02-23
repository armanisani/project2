class User < ActiveRecord::Base
  has_secure_password
  has_many :arts, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :first, presence: true
  validates :last, presence: true
  validates :age, presence: true
  validates :password, presence: true
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes




  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, default_url: "https://account.socialbakers.com/default_user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


end
