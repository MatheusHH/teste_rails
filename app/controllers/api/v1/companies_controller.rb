class Api::V1::CompaniesController < Api::V1::ApiController
  

  def index
  	if params[:name]
  	  companies = Company.where('name ILIKE ?', "%#{params[:name]}%") 
      render json: companies
    elsif params[:category_name]
      companies = Company.includes(:company_categories, :categories).references(:company_categories, :categories).where('categories.name ILIKE ?', "%#{params[:category_name]}%")
      render json: companies
    else 
  	  render json: Company.all
  	end
  end
end