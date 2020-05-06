class CompanyUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company

  enum role: [:admin, :employee]

  validates :name, :role, presence: true

  before_update :update_request_change_password


  private

   def update_request_change_password 
   	 self.request_change_password = false
   end
end
