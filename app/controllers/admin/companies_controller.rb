class Admin::CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show]

  def index
  	if params[:q]
      @q = Company.all.ransack(params[:q])
      @companies = @q.result
    else
      @q = Company.none.ransack
      @companies = Company.all
    end
  end

  def new
  	@company = Company.new 
  end

  def show
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def edit
  end

  def create
  	@company = Company.new(company_params)
    @company.user = current_user
    respond_to do |format|
      if @company.save
        format.html { redirect_to admin_companies_url, notice: 'Compania Criada com Sucesso' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to admin_companies_url, notice: 'Compania Atualizada com Sucesso' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@company.destroy
    respond_to do |format|
      format.html { redirect_to admin_companies_url, notice: 'Compania deletada com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:logo, :name, :fantasy_name, :email, :user_id, category_ids: [], company_categories_attributes: [:id, :company_id, :category_id, :_destroy])
    end

    def set_user
      @company_user = CompanyUser.new if @company_user.nil?
    end


end
