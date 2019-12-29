class Recommendation < ApplicationRecord
  validates :name,  presence: true
  validates :image, presence: true
  validates :url ,  presence: true
  validates :description,presence: true

end
