class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  mount_uploader :image, ImageUploader
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :posts
  has_many :recommendations

  has_many :user_groups
  has_many :groups, through: :user_groups

  def groups_join(group)
    groups << group
  end

  def groups_unjoin(group)
    user_groups.find_by(group_id: group.id).destroy
  end

  def groups_joining?(group)
    groups.include?(group)
  end
end
