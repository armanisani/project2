class User < ActiveRecord::Base
  has_secure_password
  has_many :arts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                    foreign_key: "follower_id",
                                    dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email,uniqueness: true, presence: true
  validates :first, presence: true
  validates :last, presence: true
  validates :age, presence: true


  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


  def already_likes?(art)
      self.likes.where("art_id = #{art.id}").count > 0
    end


  has_attached_file :avatar, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "50x50>" }, default_url: "https://account.socialbakers.com/default_user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


end
