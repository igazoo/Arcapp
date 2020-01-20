class Recommendation < ApplicationRecord
  validates :name,  presence: true
  validates :image, presence: true
  validates :url ,  presence: true
  validates :description,presence: true,
                         length: { maximum: 96 }   
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
end
