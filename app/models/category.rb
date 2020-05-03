class Category < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :company_categories
  has_many :companies, through: :company_categories

  validates :name, :tags, :visible, presence: true

  enum visible: [ :sim, :não ]
end
