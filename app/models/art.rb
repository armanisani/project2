class Art < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :style, presence: true
  validates :price, presence: true
  validates :details, presence: true
  validates :avatar, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
