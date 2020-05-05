class Company::HomeController < ApplicationController
  before_action :authenticate_company_user!
  
  def index
  end  
end
