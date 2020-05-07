class Company < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  has_many :company_categories
  has_many :categories, through: :company_categories
  has_many :company_users, dependent: :destroy

  accepts_nested_attributes_for :company_categories, reject_if: :all_blank, allow_destroy: true

  validates :fantasy_name, presence: true
  validates :name, length: { minimum: 6 }
  validates :email, presence: true, format: Devise.email_regexp
end
