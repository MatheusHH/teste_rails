class Company::HomeController < ApplicationController
  before_action :authenticate_company_user!
  before_action :redirect_user
  
  def index
  end  


  private

   def redirect_user
   	 if current_company_user.request_change_password?
   	   redirect_to edit_company_edit_password_path(current_company_user)
   	 end
   end
end
