class CompanyUser < ApplicationRecord
  
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company

  enum role: [:admin, :employee]

  validates :name, :role, presence: true

  after_update :update_request_change_password


  private

   def update_request_change_password 
   	 self.request_change_password = false
   end
end
