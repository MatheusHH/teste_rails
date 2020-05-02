class Category < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  enum visible: [ :sim, :não ]
end
