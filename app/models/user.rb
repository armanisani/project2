class User < ActiveRecord::Base
  has_secure_password
  has_many :art

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :first, presence: true
  validates :last, presence: true
  validates :age, presence: true
  validates :password, presence: true




  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


end
