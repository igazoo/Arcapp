class Recommendation < ApplicationRecord
  validates :name,  presence: true
  validates :image, presence: true
  validates :url ,  presence: true
  validates :description,presence: true
  mount_uploader :image, ImageUploader
  has_many :users
end
