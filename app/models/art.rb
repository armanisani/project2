class Art < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :name, presence: true
  validates :style, presence: true
  validates :price, presence: true
  validates :details, presence: true
  validates :avatar, presence: true

  has_attached_file :avatar, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "50x50>" }, default_url: "https://filmshotfreezer.files.wordpress.com/2011/07/untitled-1.jpg"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
