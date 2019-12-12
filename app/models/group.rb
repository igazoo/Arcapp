class Group < ApplicationRecord
  has_many :user_groups
  has_many :users,through: :usera_groups
end
